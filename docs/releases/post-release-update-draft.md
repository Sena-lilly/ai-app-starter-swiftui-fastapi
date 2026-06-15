# Post-Release Update Draft

Use this file after a human maintainer publishes `v0.1.0`.

Do not apply these edits before the release exists.

## `progress.md` Draft

```markdown
## P8 v0.1.0 Public Release

- [x] P8-A Release Preparation files drafted
- [x] Add changelog draft
- [x] Add v0.1.0 release notes draft
- [x] Add GitHub Issue and PR templates
- [x] Add local preflight checklist/script
- [x] P8-B Release Candidate Preflight local hardening
- [x] Expand backend auth/security/config/session tests
- [x] Add docs/script CI workflow
- [x] Add docs index and iOS testing plan
- [x] Add README why-this-exists polish
- [x] Add README/docs architecture diagram
- [x] Add screenshot/demo capture guide
- [x] Add GitHub labels draft
- [x] Add local-only iOS XCTest target
- [x] Finalize README for release
- [x] Finalize docs for release
- [x] Verify no secrets or production config exist
- [x] Run final release checklist
- [x] Validate GitHub Actions after push
- [x] Create v0.1.0 release after explicit human confirmation
```

## `CHANGELOG.md` Draft

Move the current `v0.1.0 - Planned` content to:

```markdown
## v0.1.0 - YYYY-MM-DD
```

Use the actual release date. Move relevant `Unreleased` items into the `v0.1.0` section, then leave a fresh empty `Unreleased` section:

```markdown
## Unreleased

### Added

### Changed

### Fixed
```

## `README.md` Status Draft

Update the status table after release:

```markdown
| Current phase | v0.1.0 released |
| Completed through | P8 v0.1.0 Public Release |
| Release state | v0.1.0 published |
| Production state | Production-minded, not production-ready |
```

Keep the production readiness language unchanged.

## GitHub Issue Comment Drafts

### Prepare v0.1.0 Release Issue Close Comment

```markdown
v0.1.0 has been published.

Included:
- SwiftUI app shell and auth flow
- Keychain token storage
- FastAPI health/auth/users endpoints
- JWT auth and password hashing
- SQLite default tests
- Docker Compose/PostgreSQL local development
- Alembic initial migration
- CI foundation
- Codex-safe workflow docs/templates
- examples and release-readiness docs
- GitHub issue/PR templates
- lightweight iOS XCTest foundation

Not included:
- production deployment
- refresh tokens
- email verification/password reset
- OAuth/roles
- App Store/TestFlight automation
- production DB configuration
- production security audit

Closing this release-prep issue. Follow-up issues remain open for screenshots/demo assets, iOS XCTest expansion, refresh token roadmap, and production deployment documentation.
```

### Screenshots/GIF Follow-Up

Keep open if reviewed assets are still missing.

```markdown
v0.1.0 shipped with a screenshot capture guide but without committed README screenshots or a demo GIF. This remains a useful onboarding improvement for a follow-up patch.
```

### iOS XCTest Coverage Follow-Up

```markdown
v0.1.0 includes a lightweight local-only XCTest target. Further coverage can add session-state, API client injection, and UI-flow tests without external network calls or real Keychain secrets.
```

### Refresh Token Roadmap Follow-Up

```markdown
Refresh tokens were intentionally excluded from v0.1.0. A future design pass should cover threat model, rotation, revocation, storage, expiry, and backend/iOS contract changes.
```

## Next Milestones

- v0.1.1 patch stabilization.
- README screenshots and optional demo GIF.
- Expanded iOS XCTest coverage.
- Refresh token roadmap.
- Production deployment guide as future work.
- More Codex-safe feature implementation examples.
