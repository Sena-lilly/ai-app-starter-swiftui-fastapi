# Architecture

This document describes the intended architecture. P4-A contains a minimal backend auth implementation, connects the SwiftUI app to it, and adds local-only Docker Compose/PostgreSQL support with Alembic migrations; most production-facing pieces remain deferred.

## High-level view

```text
SwiftUI iOS App
      |
      | HTTPS / JSON
      v
FastAPI Backend
      |
      | SQLAlchemy / migrations
      v
PostgreSQL
```

## Components

### iOS app

The iOS app is built with SwiftUI. P3 contains:

- App shell
- Navigation structure
- API client
- Environment-specific backend URL configuration
- Login and signup API integration
- Keychain access token storage
- Session restore through `/users/me`
- Logout
- Backend health-check UI

Future phases should add:

- iOS tests
- Refresh token behavior if needed

### Backend API

The backend will be built with FastAPI. It should contain:

- App factory or clear application entrypoint
- Health check endpoint
- Backend auth endpoints
- Configuration loading
- Request validation with Pydantic
- Database access layer
- Tests

### PostgreSQL

PostgreSQL is the target database for local Docker development. P4-A introduces an initial Alembic migration for the current `users` table.

### Docker Compose

Docker Compose supports local development with `backend` and `db` services. It should not be treated as production infrastructure.

## Boundaries

The iOS app should not know database details.

The backend should expose explicit JSON API contracts.

Authentication implementation should be isolated enough to test and revise.

Configuration should be environment-driven and should not contain real secrets in the repository.

## Deferred work

The following are intentionally deferred until later phases:

- Docker/PostgreSQL integration review
- Production-grade database operations
- CI configuration
- Production deployment guidance
