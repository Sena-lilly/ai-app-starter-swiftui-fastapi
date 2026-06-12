# Local Development

This document defines the intended local development experience. P7 includes a SwiftUI auth flow connected to the backend auth API, optional local-only Docker PostgreSQL setup, CI/readiness guidance, and example walkthroughs. P8-A adds release-preparation docs, P8-B adds release-candidate local preflight hardening, and the public polish pass adds lightweight iOS XCTest plus visual onboarding guidance.

## Goals

- Keep setup understandable for solo developers.
- Make backend, database, and iOS work independently testable.
- Prefer local-only services by default.
- Avoid requiring cloud accounts for basic development.
- Keep secrets out of the repository.

## Backend workflow

From the repository root:

```bash
cd backend
python -m venv .venv
source .venv/bin/activate
python -m pip install -e ".[dev]"
```

Run the local FastAPI server:

```bash
uvicorn app.main:app --reload
```

Run tests:

```bash
python -m pytest
```

The backend exposes:

```text
GET http://127.0.0.1:8000/health
POST http://127.0.0.1:8000/auth/signup
POST http://127.0.0.1:8000/auth/login
GET http://127.0.0.1:8000/users/me
```

SQLite remains the default for fast tests and local host development. It does not require Docker or PostgreSQL.

## Docker PostgreSQL workflow

From the repository root:

```bash
cp .env.example .env
docker compose up --build
```

In another terminal, run migrations:

```bash
docker compose exec backend alembic upgrade head
```

The backend service is available at:

```text
http://127.0.0.1:8000
```

The PostgreSQL service is available to the host at:

```text
127.0.0.1:5432
```

The backend container reaches PostgreSQL through the `db` hostname.

Use fake local accounts only. Do not use production databases, external databases, or real user data.

## iOS workflow

Open the app in Xcode:

```text
ios/AiAppStarter.xcodeproj
```

Select the `AiAppStarter` scheme and an iPhone simulator.

Build from the command line:

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

Run local-only XCTest when a simulator is available:

```bash
scripts/local-verify-ios-tests.sh
```

The simulator uses:

```text
http://127.0.0.1:8000
```

For a real device, use the Mac's LAN IP address in `AppConfig.localDevelopment`.

P3 iOS auth uses:

- `POST /auth/signup`
- `POST /auth/login`
- `GET /users/me`
- Keychain access token storage
- Logout that clears the token and session state

Use fake local accounts only during development. Do not enter personal credentials.

Future iOS development should add:

- ViewModel-level tests and UI smoke checks as the app grows
- Refresh token strategy if needed
- Biometric auth only after explicit design

## Docker reset safety

`docker compose down` stops the local containers.

`docker compose down -v` deletes the local PostgreSQL named volume and all local test data inside it. Do not run volume deletion unless you intend to reset local test data. Never use this against production infrastructure.

## Docker troubleshooting

If Docker commands are unavailable, install and start Docker Desktop or another Docker runtime, then confirm `docker --version` and `docker compose version`.

If port `8000` or `5432` is already in use, stop the conflicting local process before starting Compose. Do not change the Compose ports to public interfaces.

If the backend starts before migrations have run, execute:

```bash
docker compose exec backend alembic upgrade head
```

If local PostgreSQL test data becomes confusing, prefer creating a new fake local account. Do not run `docker compose down -v` unless you explicitly intend to delete the local PostgreSQL volume.

## Local-only rule

Local development commands should not deploy, push, release, call paid services, or connect to production databases.

## Verification scripts

Local helper scripts live in `scripts/`:

- `scripts/local-verify-backend.sh`
- `scripts/local-verify-ios.sh`
- `scripts/local-verify-ios-tests.sh`
- `scripts/local-verify-docker.sh`
- `scripts/secret-audit.sh`
- `scripts/preflight-local.sh`

These scripts are local-only. They do not commit, push, release, deploy, upload to App Store/TestFlight, or contact production systems.

Run the default preflight before release review:

```bash
scripts/preflight-local.sh
```

Run XCTest as part of preflight when a simulator is available:

```bash
scripts/preflight-local.sh --with-ios-tests
```

Run Docker/PostgreSQL verification only when Docker is available:

```bash
scripts/preflight-local.sh --with-docker
```
