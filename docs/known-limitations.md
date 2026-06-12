# Known Limitations

This project is early development and pre-v0.1.0.

## Auth

- No refresh tokens.
- No email verification.
- No password reset.
- No OAuth.
- No roles or permissions.
- No account deletion workflow.
- No production security audit.

## Backend / Database

- SQLite is the default fast local test path.
- Docker/PostgreSQL is local-development only.
- No production database configuration is included.
- No external database should be used during starter verification.
- Alembic currently contains only the initial users migration.

## iOS

- The iOS XCTest target is intentionally small and does not cover UI flows or Keychain persistence yet.
- No App Store/TestFlight workflow.
- No multi-account session support.
- No biometric auth.
- Real device local backend use requires manually configuring the Mac LAN IP.

## CI / Release

- CI workflow files are present locally and must be validated on GitHub after push.
- CI does not deploy, release, sign, upload, or use production services.
- No enforced Ruff/SwiftFormat configuration yet.
- README screenshots/demo GIF are prepared as a capture guide, but reviewed app screenshots are not committed yet.
- v0.1.0 has not been released yet.

## Production Readiness

The project is production-minded, not production-ready. Before production use, perform a dedicated review of authentication, database operations, secret management, observability, rate limiting, deployment, backups, incident response, and mobile release practices.
