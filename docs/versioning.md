# Versioning

This project is currently pre-v0.1.0.

## Intended Meaning of v0.1.0

`v0.1.0` should mean the repository is safe to publish and useful as an early starter kit for local development.

It should include:

- working backend health and auth endpoints
- working SwiftUI local auth flow
- local-only Docker Compose/PostgreSQL setup
- Alembic migration baseline
- tests and CI foundation
- Codex workflow docs and examples
- release-readiness and secret-audit guidance

It does not mean production readiness.

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

