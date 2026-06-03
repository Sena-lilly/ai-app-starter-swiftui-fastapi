# Architecture

This document describes the intended architecture. P3 contains a minimal backend auth implementation and connects the SwiftUI app to it; most production-facing pieces remain deferred.

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

PostgreSQL will be the primary database. The project should use migrations once schema work begins.

### Docker Compose

Docker Compose will support local development. It should not be treated as production infrastructure.

## Boundaries

The iOS app should not know database details.

The backend should expose explicit JSON API contracts.

Authentication implementation should be isolated enough to test and revise.

Configuration should be environment-driven and should not contain real secrets in the repository.

## Deferred work

The following are intentionally deferred until later phases:

- PostgreSQL migration schema
- Docker Compose configuration
- CI configuration
- Production deployment guidance
