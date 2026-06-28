# Changelog

All notable changes to this project will be documented in this file.

This project is production-minded, not production-ready.

## Unreleased

### Fixed

- Stabilized post-release docs/script verification after the v0.1.0 release.

## v0.1.0 - 2026-06-28

### Added

- P8-A release preparation docs and preflight planning.
- P8-B release candidate preflight hardening.
- GitHub Issue templates and pull request template.
- Local preflight script that runs secret audit, backend tests, iOS build, and optional Docker verification.
- v0.1.0 release notes source/archive.
- Known limitations, versioning, and public launch checklists.
- Expanded backend auth/security/config/database tests.
- Lightweight local-only iOS XCTest target.
- Docs and script CI workflow.
- Documentation index and iOS testing plan.
- README why-this-exists section and Mermaid architecture diagram.
- Screenshot/demo capture guidance.
- GitHub labels draft and expanded issue update drafts.

### Changed

- CI workflows hardened with read-only permissions, concurrency, and explicit build/test-only scope.
- Local preflight now checks shell script syntax and repository-local Markdown links.
- README and release docs clarified for public repository readiness.
- Release decision docs now explain `v0.1.0` versus `v0.1.0-pre`.

### Not Included

- Production deployment.
- Refresh tokens.
- Email verification.
- Password reset.
- OAuth.
- Roles or permissions.
- App Store/TestFlight workflow.
- UI test automation.

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
