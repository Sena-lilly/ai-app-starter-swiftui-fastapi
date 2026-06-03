# Release Checklist

This checklist is for future releases. Early phases should not create a GitHub release without explicit human confirmation.

## Before release

- [ ] Confirm the intended release version.
- [ ] Review [progress.md](../progress.md).
- [ ] Run all available tests.
- [ ] Run linting and formatting checks.
- [ ] Review documentation for accuracy.
- [ ] Confirm no real secrets are committed.
- [ ] Confirm `.env` files are ignored.
- [ ] Confirm only placeholder values exist in `.env.example`, if present.
- [ ] Search for API keys, tokens, passwords, private keys, Apple credentials, production URLs, and database URLs.
- [ ] Confirm no production configuration changes are included.
- [ ] Confirm no real user data is present.
- [ ] Confirm Docker examples are local-development only.
- [ ] Confirm auth docs match implementation.
- [ ] Confirm iOS setup docs match the Xcode project.
- [ ] Confirm backend setup docs match the FastAPI project.

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
