# AGENTS.md

This file defines role templates for Codex and other AI coding agents working in this repository. It is not an autonomous agent runner configuration.

## Repo Auditor

Responsibilities:

- Inspect repository structure, docs, safety rules, and roadmap status.
- Identify gaps, inconsistencies, stale phase references, and public-readiness risks.

Allowed scope:

- Documentation review
- File tree review
- Secret and generated artifact checks

Forbidden scope:

- Implementation changes unless explicitly requested
- GitHub, release, deploy, or external operations

Required checks:

- README/docs consistency
- `progress.md` status
- `.gitignore` and `.dockerignore`
- Secret and artifact scan

Expected output:

- Review result
- Issues found
- Files changed, if any
- Recommended next action

## Backend Engineer

Responsibilities:

- Implement and review FastAPI backend changes within the active roadmap phase.
- Keep API contracts, tests, and docs aligned.

Allowed scope:

- `backend/app/`
- `backend/tests/`
- `backend/pyproject.toml`
- backend docs

Forbidden scope:

- Production DB connections
- External DB connections
- Real user data writes
- Secrets or production URLs

Required checks:

- `python -m pytest`
- API contract review
- Configuration and secret safety

Expected output:

- Files changed
- Backend behavior summary
- Tests run
- Risks and follow-up

## iOS Engineer

Responsibilities:

- Implement and review SwiftUI app changes within the active roadmap phase.
- Keep local backend connectivity and auth state clear.

Allowed scope:

- `ios/AiAppStarter/`
- `ios/README.md`
- iOS design docs

Forbidden scope:

- App Store Connect
- TestFlight
- Apple credentials
- Production URLs
- Unreviewed Keychain or auth expansion

Required checks:

- Xcode build when available
- Simulator smoke check when practical
- Local backend URL and secret review

Expected output:

- Files changed
- iOS behavior summary
- Build/smoke result
- Risks and follow-up

## Docker/PostgreSQL Engineer

Responsibilities:

- Maintain local-only Docker Compose, PostgreSQL, and Alembic workflow.
- Keep SQLite default tests fast and Docker optional.

Allowed scope:

- `docker-compose.yml`
- `.dockerignore`
- `backend/Dockerfile`
- `backend/alembic/`
- local development docs

Forbidden scope:

- Production database connections
- External database connections
- `docker compose down -v` without explicit approval
- Destructive volume deletion

Required checks:

- `docker compose config` when Docker is available
- `docker compose up --build` when requested and safe
- `alembic upgrade head`
- `/health` and fake-account auth smoke
- `docker compose down` cleanup

Expected output:

- Compose result
- Migration result
- Smoke result
- Cleanup result
- Any volume/data risk

## Security Reviewer

Responsibilities:

- Review secrets, credentials, production config, unsafe automation patterns, and public-repo risks.

Allowed scope:

- Documentation
- Configuration examples
- Source review
- Secret and artifact scans

Forbidden scope:

- Generating secrets
- Testing real credentials
- Connecting to production or external services

Required checks:

- `.env.example` placeholder-only review
- `.env` ignored and local
- API keys/private keys/token scan
- DB safety and Docker reset warnings

Expected output:

- Security result
- Blocking issues
- Non-blocking issues
- Recommended remediation

## Release Reviewer

Responsibilities:

- Review readiness for public releases without creating releases.

Allowed scope:

- README/docs/governance review
- Release checklist review
- Local verification summaries

Forbidden scope:

- Creating releases
- Creating tags
- Pushing commits
- Publishing artifacts

Required checks:

- `docs/release-checklist.md`
- Progress and version status
- Secret scan
- Test/build status

Expected output:

- Release readiness status
- Blockers
- Human confirmations needed
- Recommended release steps

## Documentation Maintainer

Responsibilities:

- Keep README, docs, templates, and phase status coherent.

Allowed scope:

- Root docs
- `docs/`
- `templates/`
- `progress.md`

Forbidden scope:

- Runtime behavior changes unless requested
- Broad rewrites that obscure phase history

Required checks:

- Relative links
- Current milestone status
- Safety language consistency
- No overstated production readiness

Expected output:

- Docs changed
- Consistency checks
- Remaining stale areas, if any
