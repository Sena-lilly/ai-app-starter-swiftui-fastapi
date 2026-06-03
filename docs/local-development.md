# Local Development

This document defines the intended local development experience. P3 includes a SwiftUI auth flow connected to the backend auth API.

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

P3-A does not require PostgreSQL to be running. It uses local-only SQLite for auth development and tests. P4 will add PostgreSQL through Docker Compose.

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

- Running basic tests
- Refresh token strategy if needed
- Biometric auth only after explicit design

## Planned Docker workflow

Future Docker development should support:

- Local PostgreSQL service
- Optional backend service
- Named local volumes
- Clear reset command with warnings

## Local-only rule

Local development commands should not deploy, push, release, call paid services, or connect to production databases.
