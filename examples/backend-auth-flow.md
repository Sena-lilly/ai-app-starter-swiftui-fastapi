# Backend Auth Flow Example

This example uses the local FastAPI backend.

Use fake credentials only:

```text
p7-example@example.com
local-password-123
```

## Start Backend With SQLite

```bash
cd backend
source .venv/bin/activate
uvicorn app.main:app --reload
```

## Health

```bash
curl http://127.0.0.1:8000/health
```

Expected shape:

```json
{
  "status": "ok",
  "service": "backend",
  "version": "0.1.0-dev"
}
```

## Signup

```bash
curl -i \
  -X POST http://127.0.0.1:8000/auth/signup \
  -H 'Content-Type: application/json' \
  -d '{"email":"p7-example@example.com","password":"local-password-123"}'
```

Expected:

- `201 Created` for a new fake local account
- `409 Conflict` for duplicate signup
- response contains `access_token`
- response does not contain `hashed_password`

## Login

```bash
curl -i \
  -X POST http://127.0.0.1:8000/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"p7-example@example.com","password":"local-password-123"}'
```

Expected:

- `200 OK`
- `token_type` is `bearer`
- response contains `access_token`

## Current User

Use the access token from signup or login:

```bash
curl -i \
  http://127.0.0.1:8000/users/me \
  -H 'Authorization: Bearer <access_token>'
```

Expected:

- `200 OK`
- public user fields only
- no `hashed_password`

## Invalid Login

```bash
curl -i \
  -X POST http://127.0.0.1:8000/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"p7-example@example.com","password":"wrong-password"}'
```

Expected: `401 Unauthorized`.

## Missing Token

```bash
curl -i http://127.0.0.1:8000/users/me
```

Expected: `401 Unauthorized`.
