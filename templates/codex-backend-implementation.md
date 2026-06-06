# Codex Backend Implementation Prompt

Use this prompt for backend work in the active roadmap phase.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Purpose:
Implement the next backend task while preserving local-first safety.

Scope:
- Stay within the requested milestone.
- Keep FastAPI, SQLAlchemy, Alembic, auth, and tests aligned.
- Update docs when behavior changes.

Files to inspect:
- CODEX.md
- backend/README.md
- backend/pyproject.toml
- backend/app/
- backend/tests/
- docs/backend-design.md
- docs/auth-design.md, if auth is involved
- progress.md

Allowed actions:
- Edit backend code and tests for the requested phase.
- Run local pytest.
- Use placeholder-only config examples.

Forbidden actions:
- production or external DB connection
- real user data writes
- real secrets or production URLs
- git add / commit / push
- deploy, release, or external API calls
- docker compose down -v without explicit approval

Human confirmation rules:
Before any side effect outside local test/dev work, present target, operation details, impact scope, and rollback plan.

Output format:
1. Files changed
2. Backend implementation summary
3. Tests added or updated
4. Commands run
5. Secret/safety result
6. Remaining risks
7. Recommended next action
```
