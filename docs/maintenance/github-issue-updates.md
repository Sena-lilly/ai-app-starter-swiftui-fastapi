# GitHub Issue Update Drafts

These are copy/paste drafts for humans. Do not post them automatically.

## P4 Issue Close Comment Draft

```text
P4 Docker Local Setup is complete for local development.

Completed:
- backend Dockerfile
- docker-compose.yml with local-only PostgreSQL
- Alembic initial users migration
- local reset safety docs
- Docker/PostgreSQL runtime verification with fake local auth smoke

Safety:
- no production DB
- no external DB
- no real credentials
- docker compose down -v not used
```

## P5 Issue Close Comment Draft

```text
P5 Codex Workflow Integration is complete.

Completed:
- CODEX.md
- AGENTS.md
- expanded docs/codex-workflow.md
- practical Codex templates
- mutation, DB, Docker, Git/GitHub, and release safety rules

The repository remains independently usable from codex-app-workflow.
```

## P6 Issue Creation Draft

```text
Title: P6 Testing / Release Readiness

Goal:
Add local verification docs, CI foundation, secret audit checks, release readiness docs, and scripts.

Acceptance criteria:
- backend tests documented and passing
- iOS build documented and passing
- Docker/PostgreSQL local verification documented
- GitHub Actions backend/iOS workflows added
- secret audit and release readiness checklists added
- no production-ready overclaim
```

## P6 Complete Comment Draft

```text
P6 Testing / Release Readiness is complete locally.

Completed:
- backend pytest verification docs
- iOS simulator build verification docs
- CI foundation
- secret audit checklist
- release readiness checklist
- local verification scripts

Safety:
- no deploy
- no release
- no production DB
- no external DB
- no real credentials
```

## P7 Issue Creation Draft

```text
Title: P7 Examples

Goal:
Add beginner-friendly examples for backend auth, iOS auth, Docker/PostgreSQL local workflow, Codex implementation/review, and release readiness.

Acceptance criteria:
- examples/README.md exists
- backend auth flow example uses fake local credentials only
- Docker example warns against docker compose down -v
- Codex examples include human confirmation rules
```

## P7 Complete Comment Draft

```text
P7 Examples is complete locally.

Completed:
- backend auth flow example
- iOS auth flow example
- Docker/PostgreSQL local example
- Codex implementation workflow example
- Codex review workflow example
- release readiness flow example

Examples use fake local accounts only and include local-only safety notes.
```

## CI Issue Update Draft

```text
CI foundation added:
- backend SQLite pytest workflow
- iOS simulator build workflow with CODE_SIGNING_ALLOWED=NO

No deployment, signing, App Store/TestFlight upload, production DB, external DB, or secrets are used.
```

## iOS Test Issue Update Draft

```text
iOS build verification is documented and covered by the CI foundation. A lightweight local-only XCTest target is now available for DTO, endpoint, config, and error-mapping checks.

Future work:
- validate XCTest on GitHub-hosted macOS runners
- add ViewModel-level tests with test doubles
- consider UI smoke tests once the app grows
```

## P8-A Release Preparation Update Draft

```text
P8-A Release Preparation has been drafted locally.

Completed:
- CHANGELOG.md
- v0.1.0 release notes draft
- pre-release checklist
- versioning and known limitations docs
- public launch checklist
- GitHub Issue templates
- Pull Request template
- local preflight script
- CI workflow hardening

Not performed:
- no git tag
- no GitHub release
- no deploy
- no App Store/TestFlight operation
- no production DB connection
- no docker compose down -v

Next:
- review diff
- run final preflight
- verify GitHub Actions after push
- decide whether to create v0.1.0-pre or v0.1.0 only after P8 final review
```

## P8-A Complete Comment Draft

```text
P8-A Release Preparation is complete locally.

Completed:
- CHANGELOG.md
- v0.1.0 release notes draft
- pre-release checklist
- versioning docs
- known limitations docs
- public launch checklist
- GitHub Issue templates
- Pull Request template
- local preflight script

No tag, release, deploy, push, or GitHub operation was performed.
```

## P8-B Quality Hardening Comment Draft

```text
P8-B Release Candidate Preflight is complete locally.

Completed:
- expanded backend auth/security/config/session tests
- docs/script CI workflow
- shell script hardening
- Markdown relative-link checker
- docs index
- iOS testing plan
- release candidate docs polish

Verification:
- backend pytest passes locally
- preflight runs local-only checks
- Docker runtime verification remains dependent on local Docker daemon availability

No tag, release, deploy, push, GitHub operation, production DB connection, or docker compose down -v was performed.
```

## New Issue Draft: Add iOS Test Target

```text
Title: Add iOS XCTest target

Goal:
Add a minimal AiAppStarterTests target for local-only logic tests.

Acceptance criteria:
- APIErrorTests.swift
- AppConfigTests.swift
- DTOTests.swift
- no network calls
- no real Keychain secrets
- no App Store/TestFlight configuration
- CI can run xcodebuild test after GitHub runner validation
```

## New Issue Draft: Add Backend Lint / Format

```text
Title: Add backend lint and formatting checks

Goal:
Introduce a lightweight backend lint/format policy after v0.1.0.

Options:
- Ruff check for app/ and tests/
- optional Ruff format after separate review

Acceptance criteria:
- no broad unrelated reformat
- CI step is stable
- docs/testing.md is updated
```

## New Issue Draft: Validate GitHub Actions After Push

```text
Title: Validate GitHub Actions after P6/P7/P8 push

Goal:
Confirm workflows run correctly on GitHub-hosted runners.

Acceptance criteria:
- backend tests workflow passes
- iOS build workflow passes
- docs/script checks workflow passes
- no secrets are required
- no deployment/signing/upload occurs
```

## New Issue Draft: Prepare v0.1.0 Release

```text
Title: P8 Final Release Review for v0.1.0

Goal:
Run final release review before creating any tag or GitHub release.

Acceptance criteria:
- pre-release checklist complete
- CHANGELOG reviewed
- release notes reviewed
- GitHub Actions validated after push
- Docker runtime verification completed when Docker is available
- explicit human confirmation captured before tag/release
```

## New Issue Draft: Add Screenshots / Demo GIF

```text
Title: Add README screenshots or demo GIF

Goal:
Help first-time visitors understand the SwiftUI app and local auth flow.

Acceptance criteria:
- no secrets or real credentials visible
- local fake account only
- README links to image assets
- assets are lightweight
```

## New Issue Draft: Refine Architecture Diagram

```text
Title: Refine architecture diagram after v0.1.0 feedback

Goal:
Review the Mermaid architecture diagram for clarity after first public feedback.

Acceptance criteria:
- diagram still renders in GitHub Markdown
- local SQLite tests and Docker/PostgreSQL local dev are clearly separated
- Codex workflow docs/templates are represented as optional workflow support
- no production deployment is implied
```

## New Issue Draft: Add Refresh Token Roadmap

```text
Title: Add refresh token roadmap

Goal:
Document a future refresh-token approach without implementing it prematurely.

Acceptance criteria:
- describes token lifetime tradeoffs
- includes storage and rotation considerations
- does not add production claims
- keeps P3 access-token-only implementation clear
```

## Structured Issue Drafts for Public Polish

Use these when manually updating GitHub Issues. Do not post them automatically.

### P4 Issue Close Comment

```text
Title: Close P4 Docker Compose + PostgreSQL local setup

Body:
P4 is complete for local development. The repo includes backend Dockerfile support, docker-compose.yml, local PostgreSQL, Alembic initial migration, local safety docs, and fake-account verification guidance.

Scope:
- backend Dockerfile
- docker-compose.yml
- local PostgreSQL service
- Alembic initial migration
- local Docker verification docs

Out of scope:
- production Docker
- production DB
- deploys
- destructive volume resets

Safety notes:
No production DB or external DB is involved. Do not run docker compose down -v unless explicitly resetting local test data.

Suggested labels:
area: docker, area: backend, area: release
```

### P5 Issue Close Comment

```text
Title: Close P5 Codex workflow integration

Body:
P5 is complete. CODEX.md, AGENTS.md, prompt templates, safety footers, and workflow docs are in place so Codex can work inside explicit local-only boundaries.

Scope:
- Codex safety rules
- agent role templates
- implementation/review prompts
- handoff and release-check prompts

Out of scope:
- autonomous GitHub operations
- deploy/release automation
- production credentials

Safety notes:
Codex must ask for human confirmation before side-effect operations and must present target, operation details, impact scope, and rollback plan.

Suggested labels:
area: codex-workflow, area: docs, type: docs
```

### P6 Issue Close Comment

```text
Title: Close P6 Testing / Release Readiness

Body:
P6 is complete. The repo now includes backend tests, local verification scripts, secret-audit docs, CI docs, release-readiness docs, and preflight guidance.

Scope:
- backend pytest verification
- iOS build verification
- secret audit
- local preflight scripts
- GitHub Actions foundation

Out of scope:
- production deployment
- external services
- release creation

Safety notes:
Verification remains local/test-only and does not require production secrets or production DB access.

Suggested labels:
area: ci, area: release, area: docs
```

### P7 Issue Close Comment

```text
Title: Close P7 Examples

Body:
P7 is complete. Beginner-friendly examples now cover backend auth flow, iOS auth flow, Docker/PostgreSQL local workflow, Codex implementation/review workflow, and release readiness.

Scope:
- examples/backend-auth-flow.md
- examples/ios-auth-flow.md
- examples/docker-postgres-local.md
- examples/codex-feature-implementation.md
- examples/codex-review-workflow.md
- examples/release-readiness-flow.md

Out of scope:
- real credentials
- production workflows
- deployment guides

Safety notes:
Examples use fake local accounts only and explicitly avoid external systems.

Suggested labels:
area: docs, type: docs, good first issue
```

### P8-A / P8-B Progress Comment

```text
Title: P8-A/P8-B release candidate prep complete locally

Body:
P8-A and P8-B are complete locally. The repo has release prep docs, CHANGELOG, v0.1.0 draft notes, issue/PR templates, CI hardening, backend test hardening, local preflight scripts, docs navigation, and release-candidate review guidance.

Scope:
- release preparation files
- CI and script hardening
- backend auth/security tests
- public repo docs polish
- preflight tooling

Out of scope:
- tag creation
- GitHub Release creation
- deploys
- production DB or external API use

Safety notes:
No release, tag, push, deploy, App Store/TestFlight, production DB, or docker compose down -v operation should be performed by automation.

Suggested labels:
area: release, area: ci, area: docs
```

### New Issue: Prepare v0.1.0 Release

```text
Title: Prepare v0.1.0 release

Body:
Run the final release gate, verify local and GitHub checks, decide v0.1.0 vs v0.1.0-pre, and prepare final release notes.

Scope:
- backend tests
- iOS build and local XCTest
- Docker/PostgreSQL local verification
- GitHub Actions green check
- secret/artifact audit
- release notes review

Out of scope:
- production deploy
- App Store/TestFlight
- production DB

Safety notes:
Tag and release creation require explicit human confirmation.

Suggested labels:
area: release, priority: p0, release
```

### New Issue: Add Screenshots and Demo GIF

```text
Title: Add screenshots and demo GIF

Body:
Capture reviewed local-only screenshots for README onboarding and optionally a short auth-flow GIF.

Scope:
- home screenshot
- health check screenshot
- login/signup screenshot
- authenticated state screenshot
- optional local GIF

Out of scope:
- external upload
- real credentials
- production data

Safety notes:
Use fake local accounts only. Review images for secrets, tokens, private paths, and production URLs before committing.

Suggested labels:
area: ios, area: docs, type: docs
```

### New Issue: Add iOS XCTest Target Follow-up

```text
Title: Expand iOS XCTest coverage

Body:
The initial local-only XCTest target exists. Expand it with session view model tests and test doubles after v0.1.0.

Scope:
- SessionViewModel tests
- APIClient test doubles
- token store abstraction tests without real Keychain writes

Out of scope:
- UI automation
- real Keychain secrets
- App Store/TestFlight

Safety notes:
Tests must not call network, write real secrets, or require production URLs.

Suggested labels:
area: ios, type: feature, priority: p2
```

### New Issue: Validate GitHub Actions After Push

```text
Title: Validate GitHub Actions after push

Body:
Confirm backend, iOS build, and docs/script workflows pass on GitHub-hosted runners.

Scope:
- backend-tests.yml
- ios-build.yml
- docs-check.yml
- README badge validation

Out of scope:
- deploys
- signing/upload
- production DB

Safety notes:
Workflows must not require secrets or external production services.

Suggested labels:
area: ci, priority: p1
```

### New Issue: Add Refresh Token Roadmap

```text
Title: Add refresh token roadmap

Body:
Document future refresh-token design options without implementing them prematurely.

Scope:
- token lifetime tradeoffs
- storage considerations
- rotation and revocation notes
- iOS persistence implications

Out of scope:
- implementing refresh tokens
- production auth claims

Safety notes:
Do not add real secrets or production identity-provider configuration.

Suggested labels:
area: backend, area: ios, area: security, type: docs
```

### New Issue: Add Production Deployment Guide as Future Work

```text
Title: Add production deployment guide as future work

Body:
Create a future guide that explains what must be reviewed before production deployment.

Scope:
- deployment checklist
- production DB requirements
- secret management
- observability and backups
- rollback planning

Out of scope:
- actual deploy automation
- production credentials
- paid billing setup

Safety notes:
This should remain guidance only until explicitly approved.

Suggested labels:
area: docs, area: release, type: feature
```

### New Issue: Add Architecture Diagram Follow-up

```text
Title: Review architecture diagram after v0.1.0 feedback

Body:
The README and architecture docs include Mermaid diagrams. Review them after public feedback for clarity.

Scope:
- SwiftUI/API/backend/data flow
- Codex workflow layer
- SQLite tests vs Docker PostgreSQL local dev

Out of scope:
- production deployment diagrams

Safety notes:
Do not imply production readiness or production infrastructure.

Suggested labels:
area: docs, area: codex-workflow, type: docs
```

### New Issue: Improve README Visual Onboarding

```text
Title: Improve README visual onboarding

Body:
Use reviewed screenshots and concise copy to help first-time visitors understand the app quickly.

Scope:
- screenshot placement
- architecture diagram placement
- examples links
- release readiness links

Out of scope:
- marketing claims
- production-ready language

Safety notes:
Do not include secrets, real users, or production URLs in visuals.

Suggested labels:
area: docs, good first issue
```

### New Issue: Add Backend Lint / Format Policy

```text
Title: Add backend lint and format policy

Body:
Evaluate adding Ruff checks after v0.1.0 without broad unrelated reformatting.

Scope:
- ruff check config
- optional format policy
- CI integration
- docs/testing.md update

Out of scope:
- large style-only rewrite
- behavior changes

Safety notes:
Keep changes minimal and test-backed.

Suggested labels:
area: backend, area: ci, type: chore
```

## P8-G/H Release Execution Prep Drafts

Use these after a human maintainer has reviewed the final release package. Do not post them from Codex.

### P8-G Release Execution Prep Comment

```text
Title: P8-G release execution prep complete

Body:
P8-G release execution prep is complete locally.

Included:
- GitHub-ready v0.1.0 release notes draft
- manual release steps
- release preconditions and rollback notes
- post-release README/CHANGELOG/progress update draft
- Codex for OSS updated submission package
- public announcement drafts

Out of scope:
- creating the git tag
- creating the GitHub Release
- pushing commits or tags
- deploying anything

Safety notes:
All release operations remain human-only and require explicit confirmation.

Suggested labels:
area: release, area: docs, type: chore
```

### Prepare v0.1.0 Release Issue Close Comment

```text
Title: Close P8 prepare v0.1.0 release

Body:
v0.1.0 has been published by the human maintainer.

Included:
- SwiftUI app shell and auth flow
- Keychain token storage
- FastAPI `/health`, signup, login, and `/users/me`
- JWT auth and password hashing
- SQLite default tests
- Docker Compose/PostgreSQL local development
- Alembic initial migration
- GitHub Actions CI foundation
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

Follow-ups remain open for screenshots/demo assets, iOS XCTest expansion, refresh token roadmap, and production deployment documentation.

Safety notes:
The release is production-minded, not production-ready. No production systems or real secrets were used for release verification.

Suggested labels:
area: release, type: chore
```

### Codex for OSS Updated Submission Note

```text
Title: Submit updated Codex for OSS note after v0.1.0

Body:
Use docs/maintenance/codex-for-oss-updated-submission.md as the source for a human-reviewed updated submission.

Scope:
- summarize progress since initial application
- mention Docker/PostgreSQL, Alembic, CI, examples, release readiness, GitHub templates, and iOS XCTest foundation
- explain why Codex Security and API credits would help

Out of scope:
- automated submission
- GitHub API calls
- changing repository release state

Safety notes:
Review manually before sending. Do not include secrets, private data, or unsupported production-readiness claims.

Suggested labels:
area: codex-workflow, area: release, type: docs
```
