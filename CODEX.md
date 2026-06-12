# CODEX.md

This file defines how Codex and other AI coding assistants should work in `ai-app-starter-swiftui-fastapi`.

## Purpose

`ai-app-starter-swiftui-fastapi` is a production-minded starter kit for indie developers building iOS apps with SwiftUI, FastAPI, PostgreSQL, JWT authentication, Docker Compose, and Codex-safe workflows.

The repository is also an implementation template for applying safe Codex development practices to a real app stack.

## Current Architecture

- `ios/`: SwiftUI app shell with local health, signup, login, Keychain token storage, session restore, and logout.
- `backend/`: FastAPI backend with health, auth, SQLAlchemy models, JWT access tokens, SQLite default tests, and Alembic migrations.
- `docker-compose.yml`: local-only backend and PostgreSQL services.
- `docs/`: architecture, local development, auth, backend, iOS, Codex workflow, and release planning.
- `templates/`: reusable Codex task prompts.

## Current Milestone Status

The project is completed through P8-B Release Candidate Preflight locally and remains pre-v0.1.0.

- P0 Repository Bootstrap: complete
- P1 Backend MVP: complete
- P2 iOS MVP: complete
- P3 Auth Flow: complete
- P4 Docker Local Setup: complete for local development
- P5 Codex Workflow Integration: complete
- P6 Testing / Release Readiness: complete
- P7 Examples: complete
- P8-A Release Preparation: complete locally
- P8-B Release Candidate Preflight: complete locally
- P8 v0.1.0 Public Release: pending, no tag or GitHub release created

This project is production-minded, but it is not production-ready yet.

## How Codex Should Work

Codex should:

- Inspect relevant files before editing.
- State assumptions when requirements are ambiguous.
- Keep changes small and phase-scoped.
- Prefer docs and tests before broad implementation.
- Preserve local-first workflows.
- Run available local verification when practical.
- Report files changed, commands run, and remaining risks.
- Stop and ask for human confirmation before real-world side effects.

## Allowed Work

Codex may perform local-only work inside this repository, such as:

- Reading files in the repository.
- Editing documentation and templates.
- Editing backend, iOS, or Docker files when the user explicitly asks for implementation in the current phase.
- Running local tests.
- Running local build checks.
- Running local Docker commands that do not delete volumes, contact external databases, deploy, or publish.
- Creating placeholder-only configuration examples.

## Forbidden Work Without Explicit Human Instruction

Codex must not perform these operations unless the user explicitly instructs it and the confirmation rules below are satisfied:

- `git add`
- `git commit`
- `git push`
- GitHub repository creation
- GitHub release creation
- Deployments
- External API calls
- Production database connections
- External database connections
- Real user data writes
- Real user data deletion
- Real secret generation
- Credential storage or transmission
- App Store or TestFlight operations
- Paid billing operations
- Production configuration changes
- Destructive database reset
- `docker compose down -v`
- Docker volume deletion

## Human Confirmation Rules

Before any real-world side-effect operation, Codex must present:

- Target endpoint or target system
- Request body or operation details
- Impact scope
- Rollback plan

Codex must wait for explicit human approval before continuing.

## Mutation Safety Rules

Codex must treat these as side-effect operations:

- Sending emails or notifications
- Creating, approving, modifying, or deleting real data
- Writing to production or external databases
- Deploying or releasing software
- Pushing commits or tags
- Performing App Store, TestFlight, or billing operations
- Generating, storing, or transmitting credentials
- Deleting Docker volumes or local database volumes

When in doubt, Codex should stop and ask.

## Database Safety Rules

- SQLite default tests are safe and local.
- Docker PostgreSQL is local-only.
- Only fake local test accounts may be used.
- Production databases must never be connected without explicit human approval.
- External databases must not be used in the starter workflow.
- Real user data must never be written, copied, or deleted.
- PostgreSQL schema changes should use Alembic migrations.
- `.env.example` may contain placeholders only.
- `.env` must remain local and ignored.

## Docker/PostgreSQL Safety Rules

- `docker compose down` is allowed for stopping local containers after local testing.
- `docker compose down -v` deletes the local PostgreSQL volume and requires explicit confirmation.
- Docker volume deletion requires target, operation details, impact scope, and rollback or recovery plan.
- Docker examples must bind local services to localhost unless explicitly reviewed.
- Placeholder credentials must not be reused in production.

## iOS/Xcode Safety Rules

- Build and simulator checks are local-only.
- Do not configure App Store Connect.
- Do not perform TestFlight operations.
- Do not add Apple credentials.
- Do not hardcode production URLs.
- Use fake local accounts for auth testing.

## Git/GitHub/Release Safety Rules

- Do not run `git add`, `git commit`, or `git push` without explicit human instruction.
- Do not create tags, releases, or GitHub resources without explicit human confirmation.
- Do not change public release status or publish artifacts automatically.
- Release work must follow `docs/release-checklist.md` and `docs/releases/pre-release-checklist.md`.

## How To Report Changes

After each Codex task, report:

1. Files created or modified
2. Summary of changes
3. Commands run
4. Verification result
5. Secret and safety result
6. Generated artifact cleanup result
7. Known risks or missing items
8. Recommended next action

If no files were changed, say so clearly.
