#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

with_docker=0
with_ios_tests=0

for arg in "$@"; do
  case "$arg" in
    --with-docker)
      with_docker=1
      ;;
    --with-ios-tests)
      with_ios_tests=1
      ;;
    -h|--help)
      echo "Usage: scripts/preflight-local.sh [--with-docker] [--with-ios-tests]"
      echo
      echo "Runs local-only release preflight checks."
      echo "Default: secret audit, backend tests, and iOS build."
      echo "--with-docker: also runs local Docker/PostgreSQL verification."
      echo "--with-ios-tests: also runs local XCTest on the configured simulator."
      exit 0
      ;;
    *)
      echo "Unknown argument: $arg" >&2
      echo "Usage: scripts/preflight-local.sh [--with-docker] [--with-ios-tests]" >&2
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

if [ "$with_ios_tests" -eq 1 ]; then
  echo
  echo "== iOS XCTest =="
  echo "This does not sign, upload, or contact App Store/TestFlight."
  scripts/local-verify-ios-tests.sh
else
  echo
  echo "== iOS XCTest skipped =="
  echo "Run scripts/preflight-local.sh --with-ios-tests when a local Simulator is available."
fi

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
