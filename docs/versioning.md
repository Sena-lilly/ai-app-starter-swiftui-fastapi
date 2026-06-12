# Versioning

This project is currently pre-v0.1.0.

## Intended Meaning of v0.1.0

`v0.1.0` should mean the repository is safe to publish and useful as an early starter kit for local development.

It should include:

- working backend health and auth endpoints
- working SwiftUI local auth flow
- lightweight local-only iOS XCTest coverage
- local-only Docker Compose/PostgreSQL setup
- Alembic migration baseline
- tests and CI foundation
- Codex workflow docs and examples
- release-readiness and secret-audit guidance

It does not mean production readiness.

## Choosing v0.1.0 or v0.1.0-pre

Use `v0.1.0` when the release candidate has:

- passing backend tests
- passing iOS build
- passing local-only iOS XCTest, or passing `build-for-testing` with a documented simulator limitation
- passing Docker/PostgreSQL local verification when Docker is available
- green GitHub Actions after push
- clean secret and generated artifact scans
- accurate README, examples, release notes, and known limitations

Use `v0.1.0-pre` when the repository is safe to inspect publicly, but one of the release confidence checks is still pending, such as GitHub Actions validation, Docker runtime verification, screenshot/demo review, or a final release-notes copy pass.

Codex should not create tags or releases. A human maintainer must explicitly approve and perform release operations.

## Version Policy

Before `v1.0.0`, versions may change quickly. Use a semantic-versioning-inspired policy:

- Patch versions: documentation fixes, small bug fixes, safety clarifications.
- Minor versions: new starter capabilities, new examples, new optional workflows.
- Major version `1.0.0`: only after API, auth, database, iOS, release, and security practices are mature enough for stronger compatibility expectations.

## Breaking Changes

Before `v1.0.0`, these may be treated as breaking changes:

- API contract changes.
- Database schema changes requiring migrations.
- Auth token or session behavior changes.
- iOS configuration or app entrypoint changes.
- Docker Compose service name, port, or volume behavior changes.
- Codex workflow contract changes that affect safety review.

## Migration Notes

Any release with database changes should include:

- Alembic migration notes.
- Whether local fake test data can be preserved.
- Whether a manual reset is optional or required.
- A warning if any Docker volume deletion is involved.

Do not recommend destructive local resets without explaining impact and recovery.
