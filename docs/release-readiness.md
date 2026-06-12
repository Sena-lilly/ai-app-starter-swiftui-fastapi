# Release Readiness

This project is pre-v0.1.0. Release readiness means the repository is safe, understandable, locally verifiable, and honest about what is not production-ready.

## Required Checks

- README status matches current progress.
- License is present.
- Security policy is present.
- Contributing guide is present.
- Code of conduct is present.
- Backend tests pass.
- iOS simulator build passes.
- Docker/PostgreSQL local verification has been run when Docker is available.
- Secret audit passes.
- `.env.example` contains placeholders only.
- Debug and localhost configuration are documented as local-only.
- No production-ready claims are made.
- Release notes draft exists.
- Issues are triaged or documented.
- No GitHub release has been created without explicit human confirmation.
- `CHANGELOG.md` is current.
- P8-A release preparation docs are reviewed.
- P8-B release candidate checks are reviewed.

## Verification Commands

```bash
scripts/preflight-local.sh
python3 scripts/check-markdown-links.py
scripts/local-verify-backend.sh
scripts/local-verify-ios.sh
scripts/secret-audit.sh
```

Docker local verification:

```bash
scripts/preflight-local.sh --with-docker
```

Do not run Docker volume deletion as part of release readiness.

## Human Confirmation Before Release

Before any release or push action, document:

- target repository
- version or tag
- release notes payload
- impact scope
- rollback plan

Then wait for explicit human approval.

## Release Preparation References

- [releases/pre-release-checklist.md](releases/pre-release-checklist.md)
- [releases/v0.1.0-draft.md](releases/v0.1.0-draft.md)
- [versioning.md](versioning.md)
- [known-limitations.md](known-limitations.md)
