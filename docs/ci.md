# Continuous Integration

This repository includes a minimal GitHub Actions foundation.

CI is test/build-only. It does not deploy, publish releases, upload to App Store/TestFlight, connect to production databases, or require secrets.

## Backend Tests Workflow

`.github/workflows/backend-tests.yml` runs on GitHub-hosted Ubuntu.

It:

- Sets up Python.
- Installs backend dependencies with `.[dev]`.
- Runs `python -m compileall app tests`.
- Runs `python -m pytest`.
- Uses SQLite default tests only.
- Does not require Docker or PostgreSQL.
- Does not use production secrets.
- Uses read-only repository permissions.
- Uses concurrency cancellation for repeated pushes.

## iOS Build Workflow

`.github/workflows/ios-build.yml` runs on GitHub-hosted macOS.

It:

- Builds `ios/AiAppStarter.xcodeproj`.
- Uses `CODE_SIGNING_ALLOWED=NO`.
- Uses `ios/.DerivedData` as DerivedData.
- Does not sign, notarize, upload, or contact App Store/TestFlight.
- Uses read-only repository permissions.
- Uses concurrency cancellation for repeated pushes.

The repository includes a small `AiAppStarterTests` XCTest target, but CI intentionally keeps the default iOS workflow build-only until the test destination is validated on GitHub-hosted macOS runners. Local maintainers can run XCTest manually before release.

## Docs and Script Checks Workflow

`.github/workflows/docs-check.yml` runs on GitHub-hosted Ubuntu.

It:

- Checks shell script syntax with `bash -n`.
- Checks repository-local Markdown links with `scripts/check-markdown-links.py`.
- Runs `scripts/secret-audit.sh`.
- Does not fetch external URLs.
- Does not require secrets.
- Does not deploy, release, or contact production systems.

## Local Equivalent

Run the local preflight command before pushing:

```bash
scripts/preflight-local.sh
```

Optional Docker verification remains local and opt-in:

```bash
scripts/preflight-local.sh --with-docker
```

## Future CI Work

Future phases may add:

- lint and formatting checks
- iOS XCTest execution in a separate workflow or job after runner validation
- Docker/PostgreSQL integration CI
- dependency scanning

Docker/PostgreSQL CI should remain local-test scoped and must not connect to external or production databases.
