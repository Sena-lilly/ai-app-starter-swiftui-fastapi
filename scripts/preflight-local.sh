#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

with_docker=0

for arg in "$@"; do
  case "$arg" in
    --with-docker)
      with_docker=1
      ;;
    -h|--help)
      echo "Usage: scripts/preflight-local.sh [--with-docker]"
      echo
      echo "Runs local-only release preflight checks."
      echo "Default: secret audit, backend tests, and iOS build."
      echo "--with-docker: also runs local Docker/PostgreSQL verification."
      exit 0
      ;;
    *)
      echo "Unknown argument: $arg" >&2
      echo "Usage: scripts/preflight-local.sh [--with-docker]" >&2
      exit 2
      ;;
  esac
done

echo "== P8-B release candidate local preflight =="
echo "This script is local-only. It does not commit, push, release, deploy,"
echo "upload to App Store/TestFlight, contact production systems, or delete Docker volumes."

echo
echo "== Secret and artifact audit =="
scripts/secret-audit.sh

echo
echo "== Shell script syntax =="
bash -n scripts/*.sh

echo
echo "== Markdown relative links =="
python3 scripts/check-markdown-links.py

echo
echo "== Backend tests =="
scripts/local-verify-backend.sh

echo
echo "== iOS simulator build =="
scripts/local-verify-ios.sh

if [ "$with_docker" -eq 1 ]; then
  echo
  echo "== Docker/PostgreSQL local verification =="
  echo "This uses fake local data only and runs docker compose down for cleanup."
  echo "It never runs docker compose down -v."
  scripts/local-verify-docker.sh
else
  echo
  echo "== Docker/PostgreSQL local verification skipped =="
  echo "Run scripts/preflight-local.sh --with-docker when Docker is available."
fi

echo
echo "Preflight completed."
