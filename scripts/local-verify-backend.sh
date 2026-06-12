#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../backend"

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  echo "Usage: scripts/local-verify-backend.sh"
  echo
  echo "Runs backend pytest using backend/.venv when available."
  exit 0
fi

cleanup() {
  find . -name "__pycache__" -type d -prune -exec rm -rf {} +
  rm -rf .pytest_cache
}

trap cleanup EXIT

if [ -x ".venv/bin/python" ]; then
  PYTHON=".venv/bin/python"
else
  PYTHON="python"
fi

"$PYTHON" -m pytest
