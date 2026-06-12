#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  echo "Usage: scripts/local-verify-ios.sh"
  echo
  echo "Runs an unsigned iOS simulator build and cleans ios/.DerivedData."
  exit 0
fi

DERIVED_DATA_PATH="ios/.DerivedData"

cleanup() {
  rm -rf "$DERIVED_DATA_PATH"
}

trap cleanup EXIT

/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
  -project ios/AiAppStarter.xcodeproj \
  -scheme AiAppStarter \
  -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath "$DERIVED_DATA_PATH" \
  CODE_SIGNING_ALLOWED=NO \
  build
