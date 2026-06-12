# iOS Testing

The current iOS verification path includes a command-line simulator build and a small local-only XCTest target.

## Current Check

From the repository root:

```bash
scripts/local-verify-ios.sh
```

This runs an unsigned simulator build with:

- `CODE_SIGNING_ALLOWED=NO`
- DerivedData isolated to `ios/.DerivedData`
- cleanup after the build

It does not upload to App Store/TestFlight and does not require signing secrets.

## XCTest Target

`ios/AiAppStarterTests/` contains local-only tests for:

- `APIError.userMessage`
- `APIError.isInvalidOrExpiredToken`
- `AppConfig.localDevelopment`
- `HealthDTO` decoding
- `AuthResponse` decoding from snake_case JSON
- `APIEndpoint` URL construction

The target intentionally stays free of:

- network calls
- real Keychain writes
- App Store/TestFlight configuration
- signing automation
- production URLs

Run tests with an available local Simulator:

```bash
xcodebuild \
  -project ios/AiAppStarter.xcodeproj \
  -scheme AiAppStarter \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 17 Pro' \
  -derivedDataPath ios/.DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  test
```

If `xcodebuild test` cannot resolve a simulator in a restricted environment, verify that the test bundle still compiles with:

```bash
xcodebuild \
  -project ios/AiAppStarter.xcodeproj \
  -scheme AiAppStarter \
  -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath ios/.DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  build-for-testing
```

## Suggested CI Policy

Keep CI on build-only until the XCTest target is verified on a GitHub macOS runner. After that, add `xcodebuild test` as a separate workflow or separate job so build failures and test failures are easy to distinguish.

## Current Test Files

```text
ios/AiAppStarterTests/
├── APIEndpointTests.swift
├── APIErrorTests.swift
├── AppConfigTests.swift
└── DTOTests.swift
```

## Future Tests

Future additions can cover session view model behavior with test doubles, UI smoke checks, and Keychain abstraction behavior without storing real secrets.
