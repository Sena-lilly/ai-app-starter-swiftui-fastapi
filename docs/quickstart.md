# Quick Start

This project is currently completed through P8-B Release Candidate Preflight plus public repo polish locally. The backend can run locally with health and auth endpoints, the SwiftUI app can call health, signup, login, store the access token in Keychain, restore `/users/me`, and logout, Docker Compose can run a local PostgreSQL-backed backend with Alembic migrations, a lightweight iOS XCTest target exists, Codex-safe workflow guidance is available in [../CODEX.md](../CODEX.md), and example walkthroughs are available in [../examples](../examples).

## P0 quick start

1. Read [README.md](../README.md).
2. Review [progress.md](../progress.md).
3. Read the design documents in this folder.
4. Use the prompt templates in [../templates](../templates) for future Codex tasks.

## Backend quick start

From the repository root:

```bash
cd backend
python -m venv .venv
source .venv/bin/activate
python -m pip install -e ".[dev]"
uvicorn app.main:app --reload
```

Then open:

```text
http://127.0.0.1:8000/health
```

Expected response:

```json
{
  "status": "ok",
  "service": "backend",
  "version": "0.1.0-dev"
}
```

Run tests from `backend/`:

```bash
python -m pytest
```

Auth endpoints are:

```text
POST /auth/signup
POST /auth/login
GET /users/me
```

The backend uses local-only SQLite by default for fast tests and local host development.

## Docker PostgreSQL quick start

From the repository root:

```bash
cp .env.example .env
docker compose up --build
```

In another terminal:

```bash
docker compose exec backend alembic upgrade head
```

Then open:

```text
http://127.0.0.1:8000/health
```

For local auth verification, use fake local-only accounts against:

```text
POST http://127.0.0.1:8000/auth/signup
POST http://127.0.0.1:8000/auth/login
GET  http://127.0.0.1:8000/users/me
```

The Compose PostgreSQL port is bound to `127.0.0.1:5432`. Do not use production databases or real user data.

## P3 iOS quick start

Open the Xcode project:

```text
ios/AiAppStarter.xcodeproj
```

Select the `AiAppStarter` scheme and run it on an iPhone simulator.

To build from the command line:

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

To test the health and auth UI:

1. Start the backend at `http://127.0.0.1:8000`.
2. Run the iOS app in Simulator.
3. Tap `Check Backend Health`.
4. Use Signup with a fake local account such as `test@example.com`.
5. Tap Logout.
6. Use Login with the same fake local account.

The simulator uses `http://127.0.0.1:8000`. A real device must use the Mac's LAN IP address in `AppConfig.localDevelopment`.

P3 stores only the access token in Keychain. Refresh tokens, biometric auth, multi-account support, and password reset are not implemented.

## Future local quick start

The intended future full-stack flow is:

1. Copy `.env.example` to `.env`.
2. Start local services with Docker Compose.
3. Run backend migrations.
4. Start the FastAPI backend.
5. Open the SwiftUI project in Xcode.
6. Point the app at the local backend.
7. Run tests before making changes.

P4 through P7 introduce the backend/PostgreSQL, Codex workflow, testing/readiness, and example portions of this flow.

## Verification shortcuts

From the repository root:

```bash
scripts/local-verify-backend.sh
scripts/local-verify-ios.sh
scripts/local-verify-ios-tests.sh
scripts/secret-audit.sh
```

P8-B preflight shortcut:

```bash
scripts/preflight-local.sh
```

Optional local iOS XCTest verification:

```bash
scripts/preflight-local.sh --with-ios-tests
```

Optional local Docker verification:

```bash
scripts/preflight-local.sh --with-docker
```

## Local reset warning

`docker compose down` stops local containers. `docker compose down -v` deletes the local PostgreSQL volume and all local test data. Do not use volume deletion with production data or external databases.

## Safety note

Do not connect this project to production services during early development. Keep all work local unless a maintainer explicitly approves an external operation.
