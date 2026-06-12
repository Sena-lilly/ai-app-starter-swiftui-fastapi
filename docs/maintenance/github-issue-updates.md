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
iOS build verification is documented and covered by the CI foundation.

Future work:
- add an iOS test target
- add ViewModel-level tests
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
