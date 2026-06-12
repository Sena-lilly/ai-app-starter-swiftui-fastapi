# iOS

This folder contains the SwiftUI app for `ai-app-starter-swiftui-fastapi`.

The app is intentionally small: it opens to a Home screen, can call the backend `GET /health` endpoint, supports local login/signup against the FastAPI auth API, stores the access token in Keychain, restores `/users/me` on launch, and supports logout.

## P3 scope

Included through P3:

- Minimal Xcode project
- SwiftUI app entry point
- Home screen with auth state
- Real `POST /auth/login` request
- Real `POST /auth/signup` request
- `GET /users/me` session restore
- Keychain-based access token storage
- Logout
- API client bearer token support
- Basic auth error handling
- Local simulator build path
- Local-only XCTest target for config, endpoint, DTO, and error-mapping checks

Intentionally not included yet:

- Refresh tokens
- Biometric auth
- Multi-account support
- Password reset
- Email verification
- OAuth or Sign in with Apple
- App Store or TestFlight configuration

## Open the app

Open this project in Xcode:

```text
ios/AiAppStarter.xcodeproj
```

Select the `AiAppStarter` scheme and an iPhone simulator, then run the app.

## Build from the command line

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

## Run local tests

Run the lightweight XCTest target when a local simulator is available:

```bash
scripts/local-verify-ios-tests.sh
```

The tests do not call the network, write real Keychain secrets, or contact App Store/TestFlight.

## Backend health and auth

Start the backend first:

```bash
cd backend
source .venv/bin/activate
uvicorn app.main:app --reload
```

The simulator default backend URL is:

```text
http://127.0.0.1:8000
```

In the iOS app, tap `Check Backend Health`. A successful response shows:

```json
{
  "status": "ok",
  "service": "backend",
  "version": "0.1.0-dev"
}
```

Login and signup also require the local backend to be running. Use fake local development accounts only, such as `test@example.com`; do not use personal credentials.

The access token is stored in Keychain. Refresh tokens are not implemented in P3.

## Real device note

`127.0.0.1` points to the iOS device itself. For a real device, update `AppConfig.localDevelopment` to use your Mac's LAN IP address, for example:

```text
http://192.168.1.10:8000
```

Do not add production URLs or secrets.

## Next step

P8-B release candidate preflight is complete locally. P8 final release should happen only after human review. Codex workflow guidance is available in [../CODEX.md](../CODEX.md), local iOS testing notes are available in [../docs/ios-testing.md](../docs/ios-testing.md), and example app flows are available in [../examples](../examples).

See [../docs/ios-design.md](../docs/ios-design.md).
