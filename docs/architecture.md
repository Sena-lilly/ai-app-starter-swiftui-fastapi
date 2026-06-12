# Architecture

This document describes the current architecture and intended direction. P7 contains a minimal backend auth implementation, a SwiftUI auth flow, local-only Docker Compose/PostgreSQL support with Alembic migrations, Codex workflow guidance, CI foundations, and examples. P8-A adds release-preparation files, P8-B adds release-candidate local preflight hardening, and the public polish pass adds a lightweight local-only iOS XCTest target and visual onboarding guidance. Production-facing pieces remain deferred.

## High-level view

```mermaid
flowchart TD
    subgraph IOS["SwiftUI iOS App"]
        Home["Home"]
        Login["Login"]
        Signup["Signup"]
        Session["SessionViewModel"]
        Client["APIClient"]
        TokenStore["Keychain TokenStore"]
        XCTest["AiAppStarterTests"]
    end

    subgraph API["FastAPI Backend"]
        Health["GET /health"]
        SignupRoute["POST /auth/signup"]
        LoginRoute["POST /auth/login"]
        MeRoute["GET /users/me"]
        AuthDep["Auth dependency"]
        Security["JWT + password hashing"]
    end

    subgraph Persistence["Persistence and Local Verification"]
        Models["SQLAlchemy models"]
        Alembic["Alembic initial migration"]
        SQLite["SQLite default pytest"]
        Compose["Docker Compose"]
        Postgres["Local PostgreSQL"]
    end

    subgraph Workflow["Codex Workflow Layer"]
        CODEX["CODEX.md"]
        AGENTS["AGENTS.md"]
        Templates["templates/"]
        Examples["examples/"]
        Release["release readiness checks"]
    end

    Home --> Client
    Login --> Session
    Signup --> Session
    Session --> Client
    Session <--> TokenStore
    XCTest -. no network .-> Client
    Client --> Health
    Client --> SignupRoute
    Client --> LoginRoute
    Client --> MeRoute
    SignupRoute --> Security
    LoginRoute --> Security
    MeRoute --> AuthDep
    AuthDep --> Security
    API --> Models
    Models --> SQLite
    Models --> Postgres
    Alembic --> Postgres
    Compose --> API
    Compose --> Postgres
    Workflow -. guides .-> IOS
    Workflow -. reviews .-> API
    Workflow -. gates .-> Release
```

## Local development flow

```mermaid
flowchart TD
    Dev["Developer"]
    IOS["SwiftUI iOS App"]
    Config["AppConfig"]
    Client["APIClient"]
    Keychain["Keychain TokenStore"]
    API["FastAPI Backend"]
    Auth["JWT Auth Routes"]
    ORM["SQLAlchemy Models"]
    SQLite["SQLite Default Tests"]
    Compose["Docker Compose"]
    PG["Local PostgreSQL"]
    Alembic["Alembic Migrations"]
    Codex["Codex Docs / Templates"]
    CI["GitHub Actions CI"]

    Dev --> IOS
    IOS --> Config
    IOS --> Client
    IOS --> Keychain
    Client --> API
    API --> Auth
    API --> ORM
    ORM --> SQLite
    ORM --> PG
    Compose --> API
    Compose --> PG
    Alembic --> PG
    Dev --> Codex
    CI --> API
    CI --> IOS
```

## Components

### iOS app

The iOS app is built with SwiftUI. It currently contains:

- App shell
- Navigation structure
- API client
- Environment-specific backend URL configuration
- Login and signup API integration
- Keychain access token storage
- Session restore through `/users/me`
- Logout
- Backend health-check UI
- Local-only XCTest target for DTO, endpoint, config, and error mapping checks

Future phases should add:

- ViewModel and UI smoke tests when the app surface grows
- Refresh token behavior if needed

### Backend API

The backend is built with FastAPI. It currently contains:

- Clear application entrypoint
- Health check endpoint
- Backend auth endpoints
- Configuration loading
- Request validation with Pydantic
- Database access layer
- Tests

### PostgreSQL

PostgreSQL is the target database for local Docker development. The repository includes an initial Alembic migration for the current `users` table.

### Docker Compose

Docker Compose supports local development with `backend` and `db` services. It should not be treated as production infrastructure.

### Testing and CI

Backend tests default to SQLite and do not require Docker or PostgreSQL. CI includes backend pytest, iOS simulator build, and docs/script check workflows. CI does not deploy, release, sign, upload, or connect to production systems.

## Boundaries

The iOS app should not know database details.

The backend should expose explicit JSON API contracts.

Authentication implementation should be isolated enough to test and revise.

Configuration should be environment-driven and should not contain real secrets in the repository.

## Deferred work

The following are intentionally deferred until later phases:

- Production-grade database operations
- Production deployment guidance
- Refresh tokens, email verification, password reset, OAuth, and roles
- App Store/TestFlight automation
