# GitHub Labels Draft

These labels are a manual setup draft. Do not create or edit GitHub labels automatically from Codex.

| Label | Suggested color | Description | When to use |
| --- | --- | --- | --- |
| `area: backend` | `#1D76DB` | FastAPI, SQLAlchemy, Alembic, auth API | Backend implementation, tests, or API docs |
| `area: ios` | `#5319E7` | SwiftUI, APIClient, Keychain, XCTest | iOS app, local simulator, or Xcode project work |
| `area: docs` | `#0075CA` | README, docs, examples, templates | Documentation-only changes |
| `area: docker` | `#0E8A16` | Docker Compose, PostgreSQL local dev | Compose, Dockerfile, local DB workflow |
| `area: codex-workflow` | `#7057FF` | Codex prompts, safety, AGENTS/CODEX docs | AI-assisted workflow changes |
| `area: security` | `#B60205` | Secret handling, auth safety, public repo risks | Security review or mitigation |
| `area: ci` | `#C2E0C6` | GitHub Actions and local verification scripts | CI and automation safety |
| `area: release` | `#FBCA04` | Release notes, changelog, preflight | Release readiness and versioning |
| `type: bug` | `#D73A4A` | Something is broken | Reproducible defects |
| `type: feature` | `#A2EEEF` | New capability | Planned starter-kit additions |
| `type: docs` | `#0075CA` | Documentation improvement | Docs-only issue or PR |
| `type: chore` | `#EDEDED` | Maintenance work | Cleanup, dependency, or housekeeping tasks |
| `type: security-review` | `#B60205` | Needs security-focused review | Auth, secrets, DB, release, or public safety review |
| `priority: p0` | `#B60205` | Release blocker or urgent safety issue | Must fix before release/use |
| `priority: p1` | `#D93F0B` | Important near-term work | Should be handled soon |
| `priority: p2` | `#FBCA04` | Useful but not blocking | Backlog or polish work |
| `good first issue` | `#7057FF` | Friendly starter contribution | Small, well-scoped tasks |
| `help wanted` | `#008672` | Maintainer welcomes help | Community contribution wanted |
| `release` | `#FBCA04` | Release process work | Checklists, notes, final reviews |
| `blocked` | `#000000` | Waiting on another task or human decision | Cannot proceed independently |
| `needs reproduction` | `#D876E3` | Needs a reliable repro case | Bug reports without enough detail |
| `question` | `#D876E3` | Discussion or clarification | Non-actionable support/discussion |

## Safety Notes

- Do not create labels through GitHub API without explicit human confirmation.
- Do not include private contact information in labels or descriptions.
- Use `area: security` and `type: security-review` carefully; sensitive reports should follow `SECURITY.md` rather than public issue comments.
