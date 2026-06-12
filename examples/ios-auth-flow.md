# iOS Auth Flow Example

This example uses the SwiftUI simulator app with the local backend.

## Simulator URL

The simulator default backend URL is:

```text
http://127.0.0.1:8000
```

Start the backend before running the app.

## Flow

1. Open `ios/AiAppStarter.xcodeproj`.
2. Select the `AiAppStarter` scheme.
3. Run an iPhone simulator.
4. Tap `Check Backend Health`.
5. Open Signup and create a fake local account such as `p7-example@example.com`.
6. Confirm the Home screen shows the authenticated user.
7. Tap Logout.
8. Open Login and sign in with the same fake local account.
9. Relaunch the app to confirm session restore through `/users/me`.

## Token Storage

The app stores the access token in Keychain.

Do not store bearer tokens in `UserDefaults`.

## Real Device Note

On a real device, `127.0.0.1` points to the device itself. Use the Mac's LAN IP address in `AppConfig.localDevelopment`, for example:

```text
http://192.168.1.10:8000
```

Do not add production URLs or real credentials.
