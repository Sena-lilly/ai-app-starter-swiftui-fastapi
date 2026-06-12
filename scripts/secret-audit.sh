#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  echo "Usage: scripts/secret-audit.sh"
  echo
  echo "Runs a local-only secret and generated-artifact audit."
  echo "Secret values are never printed; only filenames are reported."
  exit 0
fi

status=0

echo "== Secret and artifact audit =="

if [ -f ".env" ]; then
  echo "ERROR: .env exists locally. Do not commit it. Contents were not printed."
  status=1
else
  echo "OK: .env is not present."
fi

if find . \
  -path './.git' -prune -o \
  -path './backend/.venv' -prune -o \
  -path './ios/.DerivedData' -prune -o \
  \( -name '.DS_Store' -o -name '__pycache__' -o -name '.pytest_cache' -o -name '*.db' -o -name '*.sqlite' -o -name '*.sqlite3' -o -name '*.log' \) \
  -print | grep -q .; then
  echo "ERROR: generated artifacts or local DB/log files were found."
  find . \
    -path './.git' -prune -o \
    -path './backend/.venv' -prune -o \
    -path './ios/.DerivedData' -prune -o \
    \( -name '.DS_Store' -o -name '__pycache__' -o -name '.pytest_cache' -o -name '*.db' -o -name '*.sqlite' -o -name '*.sqlite3' -o -name '*.log' \) \
    -print
  status=1
else
  echo "OK: no generated artifacts or local DB/log files found outside ignored paths."
fi

secret_matches=""
if command -v rg >/dev/null 2>&1; then
  secret_matches="$(
    rg --hidden --glob '!backend/.venv/**' --glob '!ios/.DerivedData/**' --glob '!.git/**' --glob '!scripts/secret-audit.sh' -l \
      '(sk-[A-Za-z0-9]{20,}|ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|AKIA[0-9A-Z]{16}|BEGIN (RSA |OPENSSH |EC |DSA |PRIVATE )?PRIVATE KEY)' . || true
  )"
else
  secret_matches="$(python3 scripts/secret-pattern-scan.py || true)"
fi

if [ -n "$secret_matches" ]; then
  printf '%s\n' "$secret_matches"
  echo "ERROR: potential secret-like pattern found. Filenames only are shown above."
  status=1
else
  echo "OK: no high-confidence secret patterns found."
fi

if [ -d "backend/.venv" ]; then
  echo "INFO: backend/.venv exists locally and should remain ignored."
fi

exit "$status"
