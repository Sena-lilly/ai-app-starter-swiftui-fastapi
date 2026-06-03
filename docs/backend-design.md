# Backend Design

This document describes the FastAPI backend direction. P1 added a minimal runnable backend, and P3-A adds backend auth endpoints according to [auth-design.md](auth-design.md). Migrations, Docker, PostgreSQL runtime, and production concerns remain deferred.

## Goals

- Keep the backend small and understandable.
- Use FastAPI conventions where they help readability.
- Keep API contracts explicit.
- Make tests easy to run locally.
- Isolate configuration, database, and auth concerns.

## Current P1 structure

The current backend structure is:

```text
backend/
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── api/
│   │   ├── __init__.py
│   │   └── routes/
│   │       ├── __init__.py
│   │       └── health.py
│   ├── core/
│   │   ├── __init__.py
│   │   └── config.py
│   ├── db/
│   │   ├── __init__.py
│   │   └── session.py
├── tests/
│   ├── __init__.py
│   └── test_health.py
├── pyproject.toml
└── README.md
```

P3-A adds `models/`, `schemas/`, auth dependencies, and auth routes. Future phases may add `services/`, migrations, and broader domain modules when they are needed.

## API design

The backend currently includes:

- `GET /health`

The P3-A auth API includes:

- `POST /auth/signup`
- `POST /auth/login`
- `GET /users/me`

The backend should eventually include:

- Versioned API routes if the public surface grows
- Consistent error responses beyond auth
- Example non-authenticated and authenticated domain routes

## Configuration

Configuration comes from environment variables through `pydantic-settings`. The backend reads an optional root `.env`. Real secrets must not be committed.

Placeholder configuration lives in root `.env.example`.

P3-A adds placeholder-only JWT settings such as `JWT_SECRET_KEY`, `JWT_ALGORITHM`, and `ACCESS_TOKEN_EXPIRE_MINUTES`. The repository must not generate or commit a real signing secret.

## Database

PostgreSQL is the target database. P1 includes SQLAlchemy engine/session factory helpers, but the app does not connect to a database during startup and `GET /health` works without a live database.

P3-A uses SQLite for local-only auth tests and development while keeping SQLAlchemy models portable to PostgreSQL. P4 should introduce Docker Compose and PostgreSQL.

Migrations should be introduced before the project depends on durable PostgreSQL schema changes.

## Auth structure

P3-A adds a minimal auth structure:

- `api/routes/auth.py`
- `api/routes/users.py`
- `core/security.py`
- `dependencies/auth.py`
- `models/user.py`
- `schemas/auth.py`
- `schemas/user.py`

Password hashing and JWT handling should stay isolated in `core/security.py` so they can be tested and replaced without rewriting route handlers.

## Testing

P1 includes a pytest health check test using FastAPI `TestClient`.

P3-A adds backend tests for signup, duplicate email, login, invalid login, `/users/me` with a valid token, `/users/me` without a token, and `/users/me` with an invalid token.
