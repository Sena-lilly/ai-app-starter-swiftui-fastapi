# Codex Workflow

This repository is designed for safe Codex-assisted development.

The goal is not to let automation act without oversight. The goal is to make useful local changes easier to review, test, explain, and hand off.

## Relationship With codex-app-workflow

This project is related to [codex-app-workflow](https://github.com/Sena-lilly/codex-app-workflow).

`codex-app-workflow` is a workflow kit for using Codex safely in app development.

`ai-app-starter-swiftui-fastapi` applies those ideas to a concrete SwiftUI + FastAPI + PostgreSQL starter kit.

This repository remains independent. Developers can use it without cloning or depending on `codex-app-workflow`.

## Recommended Codex Workflow

Use a staged flow:

1. Planning pass
2. Implementation pass
3. Review pass
4. Runtime verification
5. Handoff

### Planning Pass

Ask Codex to inspect relevant files, summarize current state, define scope, list risks, and propose the smallest safe change. Planning should not make behavior changes.

### Implementation Pass

Ask Codex to implement only the requested phase slice. Keep diffs small. Prefer local-only changes and update docs/tests with the implementation.

### Review Pass

Ask Codex to review the implemented slice for regressions, safety issues, stale docs, missing tests, and scope creep. Fix only clear issues.

### Runtime Verification

Run available local checks:

- Backend: `python -m pytest`
- iOS: Xcode build or simulator smoke check when available
- Docker/PostgreSQL: Compose config, migration, `/health`, and fake-account auth smoke when Docker is available

Do not contact production or external systems.

### Handoff

End with changed files, verification performed, remaining risks, cleanup status, and next recommended phase.

## Milestone-Based Workflow

- P0 Bootstrap: docs, structure, safety rules, and roadmap only.
- P1 Backend: minimal FastAPI backend and `/health`.
- P2 iOS: SwiftUI shell and local backend health wiring.
- P3 Auth: backend and iOS auth flow with local-only credentials.
- P4 Docker/PostgreSQL: local-only Docker Compose, PostgreSQL, and Alembic.
- P5 Codex Workflow: reusable Codex rules, templates, and handoff patterns.
- P6 Release Readiness: broader tests, CI, linting, and release review.

Each phase should be reviewable on its own.

## Safe Prompt Pattern

Use prompts with:

- Purpose
- Current state
- Allowed scope
- Forbidden actions
- Files to inspect
- Implementation or review requirements
- Verification commands
- Output format

Always include safety restrictions for Git, deploys, production databases, external APIs, real secrets, and destructive database operations.

## Review Prompt Pattern

A review prompt should ask Codex to:

- Inspect specific files
- Check scope control
- Check safety rules
- Run local verification where available
- Fix only clear bugs or docs mismatches
- Report files changed, if any

Reviews should lead with issues and avoid broad refactors.

## When To Stop And Ask A Human

Codex must stop before:

- `git add`, `git commit`, or `git push`
- GitHub repository or release creation
- Deployments
- External API calls
- Production or external DB connections
- Real user data writes or deletion
- Credential generation, storage, or transmission
- App Store or TestFlight operations
- Paid billing operations
- Production configuration changes
- `docker compose down -v`
- Docker volume deletion

Before asking for approval, Codex must present:

- Target endpoint or target system
- Request body or operation details
- Impact scope
- Rollback plan

## Local-Only Testing Guidance

Safe default checks:

- Run SQLite backend tests.
- Run Xcode build checks without App Store/TestFlight operations.
- Run Docker Compose against localhost with placeholder credentials.
- Use fake local test accounts only.

Database and Docker rules:

- SQLite default tests are safe and local.
- Docker PostgreSQL is local-only.
- `docker compose down` may stop local containers.
- `docker compose down -v` deletes the local PostgreSQL volume and requires explicit confirmation.
- Production DBs must never be connected without explicit human approval.
- External DBs must not be used in this starter workflow.

## Templates

Reusable prompts live in [../templates](../templates).

Start with:

- [codex-initial-audit.md](../templates/codex-initial-audit.md)
- [codex-backend-implementation.md](../templates/codex-backend-implementation.md)
- [codex-ios-implementation.md](../templates/codex-ios-implementation.md)
- [codex-docker-postgres-review.md](../templates/codex-docker-postgres-review.md)
- [codex-security-review.md](../templates/codex-security-review.md)
- [codex-release-check.md](../templates/codex-release-check.md)
- [codex-session-handoff.md](../templates/codex-session-handoff.md)
- [codex-prompt-safety-footer.md](../templates/codex-prompt-safety-footer.md)
