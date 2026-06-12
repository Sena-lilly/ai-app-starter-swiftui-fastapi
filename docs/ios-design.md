# iOS Design

This document describes the SwiftUI app direction. The current app includes local login/signup, Keychain token storage, session restore through `/users/me`, logout, backend health checks, lightweight local-only XCTest, and release-readiness build guidance according to [auth-design.md](auth-design.md).

## Goals

- Provide a clean SwiftUI starter app.
- Keep networking and auth state easy to inspect.
- Support local backend development.
- Store sensitive tokens with Keychain.
- Avoid production configuration in source control.

## Current structure

The current iOS structure is:

```text
ios/
├── AiAppStarter.xcodeproj/
├── AiAppStarter/
│   ├── AiAppStarterApp.swift
│   ├── App/
│   │   ├── AppConfig.swift
│   │   ├── AppEnvironment.swift
│   │   ├── SessionViewModel.swift
│   │   ├── TokenStore.swift
│   │   └── Info.plist
│   ├── Features/
│   │   ├── Home/
│   │   │   ├── HomeView.swift
│   │   │   └── HomeViewModel.swift
│   │   └── Auth/
│   │       ├── LoginView.swift
│   │       └── SignupView.swift
│   ├── Networking/
│   │   ├── APIClient.swift
│   │   ├── APIEndpoint.swift
│   │   ├── APIError.swift
│   │   ├── AuthDTO.swift
│   │   ├── UserDTO.swift
│   │   └── HealthDTO.swift
│   └── Shared/
│       ├── Components/
│       │   └── LoadingStateView.swift
│       └── Models/
│           └── AppErrorMessage.swift
├── AiAppStarterTests/
│   ├── APIEndpointTests.swift
│   ├── APIErrorTests.swift
│   ├── AppConfigTests.swift
│   └── DTOTests.swift
└── README.md
```

Future phases may add ViewModel tests, UI smoke tests, refresh token behavior, and a small design system when they are needed.

## App flow

The intended app flow is:

1. Launch app.
2. Show Home screen.
3. Optionally call the backend `GET /health` endpoint.
4. Navigate to Login or Signup.
5. Store the access token in Keychain after auth succeeds.
6. Restore the session by calling `/users/me` on launch when a token exists.
7. Logout clears Keychain token storage and local session state.

## Auth flow

The iOS auth flow includes:

- Real `POST /auth/login` request handling from `LoginView`.
- Real `POST /auth/signup` request handling from `SignupView`.
- A small `AuthState` or `SessionViewModel`.
- A `TokenStore` abstraction.
- Bearer token support in `APIClient`.
- `/users/me` fetch after launch when a token exists.
- Logout that clears token storage and session state.

Token storage uses Keychain. Bearer tokens must not be stored in `UserDefaults`.

## Configuration

The app uses `AppConfig.localDevelopment` for the simulator backend URL:

```text
http://127.0.0.1:8000
```

Real devices should use the Mac's LAN IP address during local development. Production URLs must not be added to the starter configuration.

## Testing

The repository includes a command-line Xcode build check and a lightweight local-only XCTest target. The first tests cover endpoint URLs, config defaults, DTO decoding, and API error mapping without network calls, real Keychain writes, production URLs, signing automation, or App Store/TestFlight behavior.

Release-readiness verification checks that the app builds without signing, auth request paths are wired to the expected endpoints, token handling behavior is explicit, and logout resets authenticated state.
