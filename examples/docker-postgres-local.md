# Docker/PostgreSQL Local Example

This example verifies the backend against local Docker PostgreSQL.

It uses placeholder credentials and fake local accounts only.

## Start Services

```bash
docker compose config
docker compose up -d --build
```

## Run Migration

```bash
docker compose exec backend alembic upgrade head
```

## Health

```bash
curl http://127.0.0.1:8000/health
```

Expected:

- HTTP `200`
- `status` is `ok`
- `service` is `backend`

## Auth Smoke

Use a fake local account:

```text
p7-example@example.com
local-password-123
```

Verify:

- signup returns `201`
- duplicate signup returns `409`
- login returns `200` and bearer token
- `/users/me` with token returns `200`
- invalid login returns `401`
- missing token returns `401`
- `hashed_password` is never exposed

## Stop Services

```bash
docker compose down
```

Do not run:

```bash
docker compose down -v
```

`down -v` deletes the local PostgreSQL named volume and local test data.
