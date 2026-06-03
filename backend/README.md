# Backend

This folder contains the FastAPI backend for `ai-app-starter-swiftui-fastapi`.

The backend is intentionally small: it can run locally, exposes `GET /health`, includes a minimal email/password auth flow, uses local-only SQLite for P3-A auth development and tests, and keeps PostgreSQL/Docker work deferred to P4.

## P3-A scope

Included in P3-A:

- FastAPI app structure
- `GET /health`
- `POST /auth/signup`
- `POST /auth/login`
- `GET /users/me`
- Password hashing with `pwdlib[argon2]`
- JWT access tokens with `PyJWT`
- Local-only SQLite database support
- pytest + FastAPI `TestClient` auth tests
- Placeholder-only configuration through optional root `.env`

Intentionally not included yet:

- Refresh tokens
- Email verification
- Password reset
- OAuth or Sign in with Apple
- Roles or permissions
- Alembic migrations
- Required PostgreSQL connection
- Dockerfile or Docker Compose setup
- Production configuration or real secrets

## Local setup

From the repository root:

```bash
cd backend
python -m venv .venv
source .venv/bin/activate
python -m pip install -e ".[dev]"
```

For future PostgreSQL driver work, install the optional extra:

```bash
python -m pip install -e ".[dev,postgres]"
```

P3-A does not require PostgreSQL to be running. The default local database URL is SQLite:

```text
sqlite:///./.local/ai_app_starter.db
```

The `.local/` directory is ignored by git.

## Run the server

From `backend/`:

```bash
uvicorn app.main:app --reload
```

Open:

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

Auth endpoints:

```text
POST http://127.0.0.1:8000/auth/signup
POST http://127.0.0.1:8000/auth/login
GET  http://127.0.0.1:8000/users/me
```

`GET /users/me` requires:

```text
Authorization: Bearer <access_token>
```

## Run tests

From `backend/`:

```bash
python -m pytest
```

## Configuration

Root `.env.example` contains placeholder-only local configuration. The backend reads an optional root `.env`. Do not commit real `.env` files or real secrets.

The included JWT secret value is a local placeholder only. Replace it outside source control for any real environment.

See [../docs/backend-design.md](../docs/backend-design.md).
