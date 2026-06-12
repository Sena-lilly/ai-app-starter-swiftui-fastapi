# iOS Testing

The current iOS verification path is a command-line simulator build. A dedicated XCTest target is still pending.

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

## Recommended XCTest Target

After v0.1.0 or during a focused P8 follow-up, add a small `AiAppStarterTests` target with local-only tests for:

- `APIError.userMessage`
- `APIError.isInvalidOrExpiredToken`
- `AppConfig.localDevelopment`
- `HealthDTO` decoding
- `AuthResponse` decoding from snake_case JSON
- `UserDTO` decoding from snake_case JSON

Keep the first test target free of:

- network calls
- real Keychain writes
- App Store/TestFlight configuration
- signing automation
- production URLs

## Suggested CI Policy

Keep CI on build-only until the test target is committed and verified on a GitHub macOS runner. After that, add `xcodebuild test` as a separate workflow or separate job so build failures and test failures are easy to distinguish.

## Future Test Files

Suggested starter files:

```text
ios/AiAppStarterTests/
├── APIErrorTests.swift
├── AppConfigTests.swift
└── DTOTests.swift
```
