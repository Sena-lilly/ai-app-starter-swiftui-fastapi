#!/usr/bin/env bash
set -euo pipefail

mode="test"

if [[ "${1:-}" == "--build-for-testing" ]]; then
  mode="build-for-testing"
  shift
fi

if [[ "${1:-}" == "--help" ]]; then
  cat <<'USAGE'
Run local-only iOS XCTest.

Usage:
  scripts/local-verify-ios-tests.sh
  scripts/local-verify-ios-tests.sh --build-for-testing

Environment:
  IOS_TEST_DESTINATION   xcodebuild destination. Defaults to:
                         platform=iOS Simulator,name=iPhone 17 Pro

This script does not sign, upload, deploy, or contact App Store/TestFlight.
Use --build-for-testing when a restricted environment cannot resolve a simulator.
USAGE
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DERIVED_DATA="${REPO_ROOT}/ios/.DerivedData"
DESTINATION="${IOS_TEST_DESTINATION:-platform=iOS Simulator,name=iPhone 17 Pro}"

cleanup() {
  rm -rf "${DERIVED_DATA}"
}
trap cleanup EXIT

echo "== iOS XCTest =="
echo "Destination: ${DESTINATION}"
echo "Mode: ${mode}"

/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
  -project "${REPO_ROOT}/ios/AiAppStarter.xcodeproj" \
  -scheme AiAppStarter \
  -configuration Debug \
  -destination "$([ "${mode}" = "build-for-testing" ] && printf '%s' "generic/platform=iOS Simulator" || printf '%s' "${DESTINATION}")" \
  -derivedDataPath "${DERIVED_DATA}" \
  CODE_SIGNING_ALLOWED=NO \
  "${mode}"
