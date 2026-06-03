# Authentication Design

This document defines the P3 Auth Flow contract. P3-A implements the backend side of this contract; P3-B connects the iOS app to it.

P3 must not include production credentials, production database URLs, external identity providers, paid services, deploys, or App Store/TestFlight operations.

## P3 scope

P3 includes:

- `POST /auth/signup`
- `POST /auth/login`
- `GET /users/me`
- Password hashing
- JWT access token issuing and validation
- Backend auth tests
- iOS login/signup requests
- iOS authenticated session state
- iOS token storage
- Logout

P3 does not include:

- Email verification
- Password reset
- Refresh tokens
- Role-based access control
- OAuth or Sign in with Apple
- Server-side sessions
- Production database integration
- Docker Compose
- App Store or TestFlight behavior

## API contract

### `POST /auth/signup`

Request body:

```json
{
  "email": "user@example.com",
  "password": "local-development-password"
}
```

Success response: `201 Created`

```json
{
  "user": {
    "id": 1,
    "email": "user@example.com",
    "created_at": "2026-01-01T00:00:00Z",
    "updated_at": "2026-01-01T00:00:00Z"
  },
  "access_token": "placeholder.jwt.token",
  "token_type": "bearer"
}
```

Duplicate email response: `409 Conflict`

```json
{
  "detail": {
    "code": "email_already_registered",
    "message": "Email is already registered."
  }
}
```

Validation error response: FastAPI default `422 Unprocessable Entity`.

### `POST /auth/login`

Request body:

```json
{
  "email": "user@example.com",
  "password": "local-development-password"
}
```

Success response: `200 OK`

```json
{
  "user": {
    "id": 1,
    "email": "user@example.com",
    "created_at": "2026-01-01T00:00:00Z",
    "updated_at": "2026-01-01T00:00:00Z"
  },
  "access_token": "placeholder.jwt.token",
  "token_type": "bearer"
}
```

Invalid credentials response: `401 Unauthorized`

```json
{
  "detail": {
    "code": "invalid_credentials",
    "message": "Invalid email or password."
  }
}
```

Validation error response: FastAPI default `422 Unprocessable Entity`.

### `GET /users/me`

Authorization header:

```text
Authorization: Bearer <access_token>
```

Success response: `200 OK`

```json
{
  "id": 1,
  "email": "user@example.com",
  "created_at": "2026-01-01T00:00:00Z",
  "updated_at": "2026-01-01T00:00:00Z"
}
```

Missing, expired, or invalid token response: `401 Unauthorized`

```json
{
  "detail": {
    "code": "invalid_or_expired_token",
    "message": "Authentication is required."
  }
}
```

### `GET /health`

Keep the P1 health contract unchanged:

```json
{
  "status": "ok",
  "service": "backend",
  "version": "0.1.0-dev"
}
```

## Data model

The minimal P3 `User` model should include:

- `id`: integer primary key
- `email`: unique, indexed, normalized lowercase string
- `hashed_password`: string
- `created_at`: UTC timestamp
- `updated_at`: UTC timestamp

The public user schema must never include `hashed_password`.

Future-safe fields such as `is_active`, `email_verified_at`, roles, or profile data should be deferred until there is a concrete need.

## Backend implementation strategy

P3-A backend additions:

```text
backend/app/
├── api/routes/
│   ├── auth.py
│   └── users.py
├── core/
│   └── security.py
├── db/
│   ├── base.py
│   └── session.py
├── dependencies/
│   ├── __init__.py
│   └── auth.py
├── models/
│   ├── __init__.py
│   └── user.py
└── schemas/
    ├── __init__.py
    ├── auth.py
    └── user.py
```

Proposed P3 backend tests:

```text
backend/tests/
├── test_auth_signup.py
├── test_auth_login.py
└── test_users_me.py
```

Dependency choices:

- Keep `SQLAlchemy` from P1.
- Use `PyJWT` for a minimal JWT implementation.
- Use `pwdlib[argon2]` for password hashing.
- Treat `passlib[bcrypt]` as a compatibility risk because passlib maintenance and bcrypt metadata compatibility have had friction in recent Python versions.
- Verify password hashing dependencies against the active Python version when updating dependencies, especially if using Python 3.14.

## Local DB strategy

Selected option: A. SQLite for P3 local auth tests and local-only development, PostgreSQL in P4 Docker.

Rationale:

- P3 should not require Docker.
- P3 should not require a live PostgreSQL service.
- Auth route behavior can be tested with a local SQLite database through SQLAlchemy.
- P4 can introduce Docker Compose and PostgreSQL without blocking P3 auth flow work.

P3 should avoid SQLite-specific schema behavior where possible so the model remains portable to PostgreSQL in P4.

## JWT strategy

P3 should use:

- Algorithm: `HS256`
- Access token expiration: 30 minutes by default
- Token payload fields:
  - `sub`: user id as a string
  - `email`: user email
  - `type`: `access`
  - `iat`: issued-at timestamp
  - `exp`: expiration timestamp
- Secret source: environment variable such as `JWT_SECRET_KEY`
- Repository value: placeholder only in `.env.example`

P3 should exclude refresh tokens. Refresh token rotation, server-side token revocation, and long-lived sessions should be revisited after the basic auth flow is working and tested.

The repository must not generate or commit a real JWT secret.

## iOS auth strategy

P3 should add a small auth layer:

- `AuthState` or `SessionViewModel` owns signed-in state.
- `TokenStore` owns access token persistence.
- `APIClient` accepts an optional bearer token and attaches `Authorization: Bearer <token>` for authenticated requests.
- `LoginView` submits credentials and updates session state on success.
- `SignupView` submits credentials and updates session state on success.
- `/users/me` is fetched after launch when a token exists, and after login/signup.
- Logout clears token storage and resets session state.

Token storage:

- P3-B uses Keychain for access token storage.
- Do not store bearer tokens in `UserDefaults`.
- Refresh tokens, biometrics, and multi-account token storage are deferred.

## Error contract

Backend:

- Use FastAPI default `422` validation errors for invalid request shapes.
- Use structured `detail` objects for expected auth failures.
- Use `409` for duplicate email.
- Use `401` for invalid credentials and invalid/missing/expired tokens.

iOS:

- Keep mapping transport, invalid response, decoding, and server errors through `APIError`.
- Map auth error codes to user-facing messages:
  - `email_already_registered`
  - `invalid_credentials`
  - `invalid_or_expired_token`
- Expired or invalid token should clear the local session after confirmation from `/users/me` failure.

## Test plan

Backend P3 tests:

- Signup succeeds and returns user plus bearer access token.
- Duplicate email returns `409`.
- Login succeeds with valid credentials.
- Login rejects invalid credentials with `401`.
- `/users/me` succeeds with a valid token.
- `/users/me` rejects a missing token with `401`.
- `/users/me` rejects an invalid token with `401`.
- `GET /health` remains unchanged.

iOS P3 checks:

- Xcode build succeeds.
- Login request path calls `POST /auth/login`.
- Signup request path calls `POST /auth/signup`.
- Authenticated state updates after login/signup.
- Token persistence behavior is explicit and documented.
- Logout clears local auth state.
- `/users/me` request includes the bearer token.

## Recommended P3 split

Implement P3 in three smaller passes:

- P3-A Backend Auth MVP
- P3-B iOS Auth MVP
- P3-C Integration Review

This split keeps database/JWT/password hashing decisions reviewable before adding iOS state and token persistence. It also gives a clean checkpoint for backend contract tests before the iOS app depends on the contract.

## Decisions before implementation

- Confirm password hashing library after checking Python version compatibility.
- Review Keychain behavior during P3-C integration verification.
- Decide whether local SQLite app data should be file-based for manual testing or in-memory/test-only for P3-A.
