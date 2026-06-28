# Release Readiness

This project has published the v0.1.0 baseline. Release readiness still means the repository is safe, understandable, locally verifiable, and honest about what is not production-ready.

## Required Checks

- README status matches current progress.
- License is present.
- Security policy is present.
- Contributing guide is present.
- Code of conduct is present.
- Backend tests pass.
- iOS simulator build passes.
- Local-only iOS XCTest passes when a simulator is available, or `build-for-testing` passes and the simulator limitation is documented.
- Docker/PostgreSQL local verification has been run when Docker is available.
- Secret audit passes.
- `.env.example` contains placeholders only.
- Debug and localhost configuration are documented as local-only.
- No production-ready claims are made.
- Screenshot/demo assets are either reviewed and linked or intentionally left as a capture guide.
- Release notes source exists.
- Issues are triaged or documented.
- No GitHub release or future release operation is created without explicit human confirmation.
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

Run iOS XCTest when a local simulator is available:

```bash
xcodebuild \
  -project ios/AiAppStarter.xcodeproj \
  -scheme AiAppStarter \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 17 Pro' \
  -derivedDataPath ios/.DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  test
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
