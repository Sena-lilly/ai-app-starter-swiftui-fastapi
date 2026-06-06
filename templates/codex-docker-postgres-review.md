# Codex Docker/PostgreSQL Review Prompt

Use this prompt for P4 Docker Compose, PostgreSQL, and Alembic review.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Purpose:
Review and verify local-only Docker/PostgreSQL integration.

Scope:
- Validate Docker Compose, backend Dockerfile, Alembic migration, DATABASE_URL switching, and docs.
- Run Docker verification only when Docker is available and local-only.

Files to inspect:
- CODEX.md
- docker-compose.yml
- .dockerignore
- .env.example
- backend/Dockerfile
- backend/alembic/
- backend/app/db/session.py
- backend/app/core/config.py
- backend/README.md
- docs/local-development.md
- docs/backend-design.md
- docs/quickstart.md

Allowed actions:
- Run docker compose config.
- Run docker compose up --build for local-only verification.
- Run alembic upgrade head inside the backend container.
- Use fake local test accounts only.
- Stop containers with docker compose down.

Forbidden actions:
- production or external DB connection
- real user data writes
- docker compose down -v without explicit approval
- Docker volume deletion without explicit approval
- deploy, release, git push, or external API calls

Human confirmation rules:
Before volume deletion or destructive DB reset, present target volume, operation details, impact scope, and rollback or recovery plan.

Output format:
1. Docker availability
2. Compose config result
3. Compose up/build result
4. Alembic result
5. /health result
6. Auth smoke result
7. Cleanup result
8. Files changed, if any
9. Remaining risks
10. Recommended next action
```
