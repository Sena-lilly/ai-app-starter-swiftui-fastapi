# Changelog

All notable changes to this project will be documented in this file.

This project is pre-v0.1.0. Release dates are intentionally left as `TBD` until a release is actually created by a human maintainer.

## Unreleased

### Added

- P8-A release preparation docs and preflight planning.
- P8-B release candidate preflight hardening.
- GitHub Issue templates and pull request template.
- Local preflight script that runs secret audit, backend tests, iOS build, and optional Docker verification.
- v0.1.0 draft release notes.
- Known limitations, versioning, and public launch checklists.
- Expanded backend auth/security/config/database tests.
- Docs and script CI workflow.
- Documentation index and iOS testing plan.

### Changed

- CI workflows hardened with read-only permissions, concurrency, and explicit build/test-only scope.
- Local preflight now checks shell script syntax and repository-local Markdown links.
- README and release docs clarified for public repository readiness.

## v0.1.0 - Planned

Release date: TBD

### Planned Highlights

- Repository bootstrap and phase-based roadmap.
- FastAPI backend with `GET /health`.
- Backend signup, login, and `/users/me` auth flow with JWT access tokens.
- SQLite default backend tests for fast local verification.
- SwiftUI iOS app shell with health check, signup, login, Keychain access token storage, session restore, and logout.
- Local-only Docker Compose/PostgreSQL setup with Alembic migration support.
- Codex-safe workflow guidance, prompt templates, and agent role templates.
- Testing, CI, release-readiness, and secret-audit documentation.
- Beginner-friendly examples for backend auth, iOS auth, Docker/PostgreSQL, Codex workflow, and release readiness.

### Not Included

- Production deployment.
- Refresh tokens.
- Email verification.
- Password reset.
- OAuth.
- Roles or permissions.
- App Store/TestFlight workflow.
- iOS test target.

## pre-v0.1.0

### Added

- P0 Repository Bootstrap.
- P1 Backend MVP.
- P2 iOS MVP.
- P3 Auth Flow.
- P4 Docker Local Setup.
- P5 Codex Workflow Integration.
- P6 Testing / Release Readiness.
- P7 Examples.
