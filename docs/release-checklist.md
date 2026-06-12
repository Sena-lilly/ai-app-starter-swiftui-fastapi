# Release Checklist

This checklist is for future releases. Early phases should not create a GitHub release without explicit human confirmation.

## Before release

- [ ] Confirm the intended release version.
- [ ] Review [progress.md](../progress.md).
- [ ] Run all available tests.
- [ ] Run linting and formatting checks when configured.
- [ ] Review documentation for accuracy.
- [ ] Confirm no real secrets are committed.
- [ ] Confirm `.env` files are ignored.
- [ ] Confirm only placeholder values exist in `.env.example`, if present.
- [ ] Search for API keys, tokens, passwords, private keys, Apple credentials, production URLs, and database URLs.
- [ ] Confirm no production configuration changes are included.
- [ ] Confirm no real user data is present.
- [ ] Confirm Docker examples are local-development only.
- [ ] Confirm `docker compose down -v` was not used during verification.
- [ ] Confirm auth docs match implementation.
- [ ] Confirm iOS setup docs match the Xcode project.
- [ ] Confirm backend setup docs match the FastAPI project.
- [ ] Confirm backend tests pass.
- [ ] Confirm iOS simulator build passes with `CODE_SIGNING_ALLOWED=NO`.
- [ ] Confirm Docker/PostgreSQL local verification has been run when Docker is available.
- [ ] Confirm release notes are drafted.
- [ ] Confirm no production-ready overclaim exists.
- [ ] Review [releases/pre-release-checklist.md](releases/pre-release-checklist.md).
- [ ] Review [releases/v0.1.0-draft.md](releases/v0.1.0-draft.md).
- [ ] Review [known-limitations.md](known-limitations.md).

## Suggested local commands

```bash
scripts/preflight-local.sh
scripts/local-verify-backend.sh
scripts/local-verify-ios.sh
scripts/secret-audit.sh
```

Optional Docker check:

```bash
scripts/preflight-local.sh --with-docker
```

## Side-effect confirmation

Before creating a release, document:

- Target repository
- Version tag
- Release notes payload
- Impact scope
- Rollback plan

Do not create a GitHub release without explicit human confirmation.

## After release

- [ ] Verify release artifacts.
- [ ] Verify README links.
- [ ] Record known issues.
- [ ] Update roadmap status.
