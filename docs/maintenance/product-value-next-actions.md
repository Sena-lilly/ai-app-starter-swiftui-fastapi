# Product Value Next Actions

This document lists high-leverage follow-up work after the v0.1.0 release. It is a planning note only. Do not create GitHub Issues, labels, releases, deployments, or external operations automatically from this file.

## Priority 1: Keep Actions Green

Goal:

- Re-run GitHub Actions after the post-release stabilization commit.
- Confirm backend tests, iOS build, and docs/script checks are green.

Why:

- A starter kit earns trust when first-time visitors see passing CI.

Notes:

- Docs/script checks are local-only and should not deploy, release, sign, upload, or use secrets.
- If a generated `__pycache__` appears during local script experiments, remove it before running `scripts/secret-audit.sh`.

## Priority 2: README Screenshots / Demo GIF

Goal:

- Capture reviewed local screenshots for the SwiftUI home, signup, login, authenticated state, and backend health flow.
- Add a short demo GIF only if it is lightweight and reviewed.

Why:

- Visual onboarding helps GitHub visitors understand the app faster.

Safety:

- Use fake local accounts only.
- Do not show real credentials, tokens, production URLs, or private machine paths.

## Priority 3: Issue / Label Organization

Goal:

- Manually close completed P4-P8 issues.
- Manually create follow-up issues for v0.1.1 stabilization, screenshots, iOS test expansion, refresh tokens, and production deployment docs.
- Apply labels from `docs/maintenance/github-labels.md`.

Why:

- Clear public maintenance signals help contributors and future users.

## Priority 4: v0.1.1 Stabilization

Goal:

- Keep the first patch release small.
- Prefer docs, CI, test stability, and onboarding improvements over new runtime behavior.

Candidate items:

- Fix any post-release docs-check issues.
- Improve README clarity based on first visitor feedback.
- Add screenshots after review.
- Tighten local verification docs.

## Priority 5: iOS XCTest Execution Stability

Goal:

- Validate the lightweight iOS XCTest target on local Xcode and GitHub-hosted macOS runners.
- Expand tests only with deterministic, local-only cases.

Avoid:

- External network calls.
- Real Keychain secrets.
- App Store/TestFlight automation.

## Priority 6: Refresh Token Roadmap

Goal:

- Design refresh tokens separately before implementation.

Topics:

- Rotation and revocation.
- Access-token expiry.
- iOS storage.
- Logout semantics.
- Backend schema changes.

## Priority 7: Production Deployment Guide as Future Work

Goal:

- Document deployment considerations without making this starter production-ready by default.

Topics:

- Secret management.
- TLS.
- Production database migrations.
- Backups.
- Observability.
- Rate limiting.
- Incident response.

## Priority 8: Codex for OSS Updated Submission

Goal:

- Manually send the updated submission note after review.

Source:

- `docs/maintenance/codex-for-oss-updated-submission.md`

## Priority 9: Cross-Link with codex-app-workflow

Goal:

- Strengthen the relationship between this working starter kit and `codex-app-workflow`.

Approach:

- Keep this repo independently usable.
- Add reciprocal links only through human-reviewed docs or README updates.
- Avoid implying that this repo depends on `codex-app-workflow` to run.
