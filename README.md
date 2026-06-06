# ai-app-starter-swiftui-fastapi

A production-minded starter kit for indie developers building iOS apps with SwiftUI, FastAPI, PostgreSQL, JWT authentication, Docker Compose, and Codex-friendly workflows.

This repository is currently completed through **P4-A Docker PostgreSQL MVP**. It contains repository design, documentation, a minimal runnable FastAPI backend, backend signup/login/users/me auth endpoints, local-only SQLite auth tests, configuration scaffolding, a SwiftUI app that can check backend health, log in, sign up, store an access token in Keychain, restore `/users/me`, and log out, plus local-only Docker Compose/PostgreSQL setup with Alembic migrations. Refresh tokens, production deployment, and release readiness are intentionally deferred to later phases.

## What is this?

`ai-app-starter-swiftui-fastapi` is an open source starter kit for building a real iOS app stack with:

- SwiftUI for the iOS client
- FastAPI for the backend API
- PostgreSQL for persistent storage
- JWT-based authentication
- Docker Compose for local infrastructure
- Codex-friendly workflows for safer AI-assisted development

The goal is to give solo developers and small teams a practical foundation that is simple enough to understand, but structured enough to grow toward production.

This project is production-minded, but it is not production-ready yet.

## Who is this for?

This project is for:

- Indie iOS developers who want a backend-backed SwiftUI app starter
- Backend developers who want a clean FastAPI base for mobile apps
- Developers using Codex or other AI coding assistants who want guardrails
- Builders who prefer local-first development before production deployment
- OSS maintainers who want clear phase-based planning and release discipline

This project is not intended to hide the architecture behind a black box. It should teach the shape of the stack while giving you a useful starting point.

## What is included?

The repository currently includes:

- Repository-level documentation
- Architecture and design notes
- Codex workflow guidance
- Safety and security rules
- Roadmap and release checklist
- Minimal FastAPI backend under `backend/`
- Backend auth endpoints for signup, login, and `/users/me`
- SwiftUI app with local auth flow under `ios/`
- Local-only Docker Compose/PostgreSQL setup
- Minimal Alembic migration for the current `users` table
- Prompt templates for future Codex implementation phases

Future phases will add:

- iOS tests, CI/release readiness, and example app flows

## Architecture overview

The intended architecture is:

```text
SwiftUI iOS App
      |
      | HTTPS / JSON API
      v
FastAPI Backend
      |
      | SQLAlchemy / migrations
      v
PostgreSQL
```

Local Docker development uses Docker Compose for PostgreSQL and the backend service. The iOS app communicates with the local backend through configurable environment settings.

See [docs/architecture.md](docs/architecture.md) for the full design direction.

## Quick Start

Current quick start:

1. Read this README.
2. Review [progress.md](progress.md) to understand the project phase checklist.
3. Read [docs/quickstart.md](docs/quickstart.md) for backend and iOS setup flows.
4. Use the templates in [templates/](templates/) when asking Codex to perform future phase work.

The current runnable surfaces are the backend health/auth endpoints and the SwiftUI health/auth app flow.

## Repository structure

```text
.
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── SECURITY.md
├── CODE_OF_CONDUCT.md
├── progress.md
├── docs/
├── ios/
├── backend/
└── templates/
```

See each folder README or design document for its intended role.

## Roadmap

The project is organized into phases:

- P0 Repository Bootstrap
- P1 Backend MVP
- P2 iOS MVP
- P3 Auth Flow
- P4 Docker Local Setup
- P5 Codex Workflow Integration
- P6 Testing / Release Readiness
- P7 Examples
- P8 v0.1.0 Public Release

See [docs/roadmap.md](docs/roadmap.md) and [progress.md](progress.md).

## Relationship with codex-app-workflow

This project is related to [codex-app-workflow](https://github.com/Sena-lilly/codex-app-workflow).

`codex-app-workflow` is a workflow kit for using Codex safely in app development.

`ai-app-starter-swiftui-fastapi` is a working starter kit that applies those workflows to a SwiftUI + FastAPI + PostgreSQL app stack.

This repository should remain usable on its own. It may reference `codex-app-workflow` for process ideas, but it must not require that repository to run, build, test, or release.

## Safety rules

Codex and other automation tools must not perform real-world side-effect operations without explicit human confirmation.

Do not execute the following without explicit human confirmation:

- GitHub repository creation
- `git init`
- `git commit`
- `git push`
- GitHub release creation
- Deployments
- External API calls
- App Store or TestFlight operations
- Production database connections
- Real database writes
- Real user data deletion
- Authentication credential generation or transmission
- Paid billing operations
- Production configuration changes

If a side-effect operation is needed, present the following first:

- Target
- Payload or operation details
- Impact scope
- Rollback plan

Preferred operating mode:

- Code review
- Procedure guidance
- Root-cause analysis
- Dry-run
- Local-only changes
- Test-first implementation
- Minimal diff
- Documentation-first planning

## Contributing

Contributions are welcome once the project moves beyond bootstrap. Please read [CONTRIBUTING.md](CONTRIBUTING.md), [SECURITY.md](SECURITY.md), and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) before opening issues or pull requests.

For now, changes should preserve the phase-based roadmap and avoid adding full implementation code before the relevant phase.

## License

MIT License. See [LICENSE](LICENSE).
