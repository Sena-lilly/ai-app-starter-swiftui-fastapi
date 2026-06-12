#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  echo "Usage: scripts/local-verify-docker.sh"
  echo
  echo "Runs local Docker/PostgreSQL verification with fake local data."
  echo "Uses docker compose down for cleanup and never runs docker compose down -v."
  exit 0
fi

cleanup() {
  docker compose down || true
}

trap cleanup EXIT

docker compose config
docker compose up -d --build
docker compose exec backend alembic upgrade head

for attempt in $(seq 1 20); do
  if curl --fail --silent --show-error http://127.0.0.1:8000/health; then
    break
  fi
  if [ "$attempt" -eq 20 ]; then
    echo "Backend health check did not pass in time."
    exit 1
  fi
  sleep 1
done
printf '\n'

python - <<'PY'
import json
import urllib.error
import urllib.request

base_url = "http://127.0.0.1:8000"
email = "p8-preflight@example.com"
password = "local-password-123"

def request(path, method="GET", body=None, token=None):
    data = None
    headers = {"Accept": "application/json"}
    if body is not None:
        data = json.dumps(body).encode("utf-8")
        headers["Content-Type"] = "application/json"
    if token:
        headers["Authorization"] = f"Bearer {token}"
    req = urllib.request.Request(base_url + path, data=data, headers=headers, method=method)
    try:
        with urllib.request.urlopen(req, timeout=10) as response:
            payload = response.read().decode("utf-8")
            return response.status, json.loads(payload) if payload else {}
    except urllib.error.HTTPError as exc:
        payload = exc.read().decode("utf-8")
        return exc.code, json.loads(payload) if payload else {}

signup_status, signup_body = request(
    "/auth/signup",
    method="POST",
    body={"email": email, "password": password},
)
if signup_status not in {201, 409}:
    raise SystemExit(f"signup failed with {signup_status}: {signup_body}")

login_status, login_body = request(
    "/auth/login",
    method="POST",
    body={"email": email, "password": password},
)
if login_status != 200:
    raise SystemExit(f"login failed with {login_status}: {login_body}")

token = login_body.get("access_token")
if not token:
    raise SystemExit("login response did not include access_token")

me_status, me_body = request("/users/me", token=token)
if me_status != 200 or me_body.get("email") != email:
    raise SystemExit(f"users/me failed with {me_status}: {me_body}")

invalid_status, _ = request(
    "/auth/login",
    method="POST",
    body={"email": email, "password": "wrong-password"},
)
if invalid_status != 401:
    raise SystemExit(f"invalid login returned {invalid_status}, expected 401")

missing_status, _ = request("/users/me")
if missing_status != 401:
    raise SystemExit(f"missing token returned {missing_status}, expected 401")

print("Docker auth smoke passed with fake local account.")
PY
