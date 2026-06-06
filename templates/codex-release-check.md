# Codex Release Check Prompt

Use this prompt before any public release or tag.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Purpose:
Perform a release readiness review without creating a release.

Scope:
- Review docs, roadmap, tests, generated artifacts, and secret safety.
- Identify blockers and required human confirmations.
- Do not publish anything.

Files to inspect:
- README.md
- CODEX.md
- SECURITY.md
- CONTRIBUTING.md
- progress.md
- docs/release-checklist.md
- docs/
- backend/
- ios/
- templates/

Allowed actions:
- Run local tests/build checks when appropriate.
- Run secret/artifact scans.
- Update docs only if there is a clear release-readiness mismatch.

Forbidden actions:
- GitHub release creation
- git add / commit / push
- deploy
- external API calls
- production DB or external DB connection
- credential generation or transmission
- App Store/TestFlight operations
- docker compose down -v

Human confirmation rules:
Before any release, tag, push, deploy, or external operation, present target, operation details, impact scope, and rollback plan. Wait for explicit approval.

Output format:
1. Release readiness status
2. Blocking issues
3. Non-blocking issues
4. Secret/privacy result
5. Tests or checks run
6. Files changed, if any
7. Required human confirmations
8. Recommended next action
```
