# Backend

This folder contains the FastAPI backend for `ai-app-starter-swiftui-fastapi`.

The backend is intentionally small: it can run locally, exposes `GET /health`, includes a minimal email/password auth flow, uses local-only SQLite for fast tests, and supports optional local-only PostgreSQL through Docker Compose.

## Current scope

Included in the current pre-v0.1.0 starter:

- FastAPI app structure
- `GET /health`
- `POST /auth/signup`
- `POST /auth/login`
- `GET /users/me`
- Password hashing with `pwdlib[argon2]`
- JWT access tokens with `PyJWT`
- Local-only SQLite database support
- Optional local-only PostgreSQL support through Docker Compose
- Alembic migration for the current `users` table
- pytest + FastAPI `TestClient` auth tests
- Local verification scripts and CI workflow support from the repository root
- Placeholder-only configuration through optional root `.env`

Intentionally not included yet:

- Refresh tokens
- Email verification
- Password reset
- OAuth or Sign in with Apple
- Roles or permissions
- Production configuration or real secrets

## Local setup

From the repository root:

```bash
cd backend
python -m venv .venv
source .venv/bin/activate
python -m pip install -e ".[dev]"
```

For local PostgreSQL driver work outside Docker, install the optional extra:

```bash
python -m pip install -e ".[dev,postgres]"
```

The default local database URL is SQLite:

```text
sqlite:///./.local/ai_app_starter.db
```

The `.local/` directory is ignored by git.

## Docker PostgreSQL local development

From the repository root:

```bash
cp .env.example .env
docker compose up --build
```

In another terminal, run the migration inside the backend container:

```bash
docker compose exec backend alembic upgrade head
```

Then open:

```text
http://127.0.0.1:8000/health
```

The Docker backend uses this internal database URL:

```text
postgresql+psycopg://app_user:app_password@db:5432/ai_app_starter
```

The host machine can connect to the local Docker PostgreSQL service with:

```text
postgresql+psycopg://app_user:app_password@localhost:5432/ai_app_starter
```

These credentials are placeholders for local development only.

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

Default tests use SQLite and do not require Docker or PostgreSQL.

## Configuration

Root `.env.example` contains placeholder-only local configuration. The backend reads an optional root `.env`. Do not commit real `.env` files or real secrets.

The included JWT secret value is a local placeholder only. Replace it outside source control for any real environment.

## Database reset safety

`docker compose down` stops local containers.

`docker compose down -v` deletes the local PostgreSQL named volume and all local test data inside it. Do not run it against production infrastructure. This project does not include production database configuration.

See [../docs/backend-design.md](../docs/backend-design.md).
