# Testing

This document describes the current local verification strategy for `ai-app-starter-swiftui-fastapi`.

The project remains pre-v0.1.0 and production-minded, not production-ready.

## Backend Tests

Backend tests are the default fast verification path.

From the repository root:

```bash
cd backend
source .venv/bin/activate
python -m pytest
```

Expected result:

```text
26 passed
```

A known warning may appear from FastAPI/Starlette `TestClient` about future `httpx` compatibility. It is non-blocking for the current phase.

The default backend tests use SQLite and do not require Docker or PostgreSQL.

## iOS Build Verification

The iOS verification path is a simulator build only. It does not sign, upload, or contact App Store/TestFlight services.

From the repository root:

```bash
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild \
  -project ios/AiAppStarter.xcodeproj \
  -scheme AiAppStarter \
  -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath ios/.DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  build
```

After the build, `ios/.DerivedData` may be deleted.

## Docker/PostgreSQL Local Verification

Docker/PostgreSQL verification is optional local integration testing. It must not use production or external databases.

From the repository root:

```bash
docker compose config
docker compose up -d --build
docker compose exec backend alembic upgrade head
curl http://127.0.0.1:8000/health
docker compose down
```

For auth smoke tests, use fake local accounts such as:

```text
p6-test@example.com
p7-example@example.com
p8-preflight@example.com
release-check@example.com
```

Never use real email/password credentials.

Do not run:

```bash
docker compose down -v
```

That command deletes the local PostgreSQL named volume and local test data.

## Local Verification Scripts

Convenience scripts live in `scripts/`:

- `scripts/local-verify-backend.sh`
- `scripts/local-verify-ios.sh`
- `scripts/local-verify-docker.sh`
- `scripts/secret-audit.sh`
- `scripts/preflight-local.sh`

They are local-only helpers and do not deploy, push, release, or contact production systems.

`scripts/preflight-local.sh` runs secret audit, backend tests, and iOS build by default. Use `scripts/preflight-local.sh --with-docker` only when Docker is available and local Docker/PostgreSQL verification is desired.

P8-B also checks shell script syntax and repository-local Markdown links during preflight.

## Linting and Formatting

Dedicated linting and formatting tools are not configured yet.

Until P6/P8 hardening adds specific tools, contributors should:

- keep Python formatted consistently with the surrounding FastAPI code
- keep Swift formatted consistently with the existing SwiftUI files
- avoid broad style-only rewrites
- prefer small diffs that are easy to review

Future work may add Ruff, SwiftFormat, or equivalent tooling after explicit project review.

Ruff is intentionally not added before v0.1.0 in this pass because the current goal is a stable local starter without adding a new unverified dependency. Backend syntax/import sanity is covered by `python -m compileall app tests` in CI.
