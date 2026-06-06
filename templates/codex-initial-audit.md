# Codex Initial Audit Prompt

Use this prompt before implementation or when resuming an unfamiliar thread.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Purpose:
Audit the repository state for the current roadmap phase before making changes.

Scope:
- Review repository structure, docs, progress.md, and safety rules.
- Identify stale phase references, missing docs, risky generated files, and next-step blockers.
- Do not implement unless explicitly asked.

Files to inspect:
- README.md
- CODEX.md
- AGENTS.md
- progress.md
- docs/
- backend/README.md
- ios/README.md
- templates/

Allowed actions:
- Read files.
- Run local-only inspection commands.
- Make no changes unless fixing an obvious typo or broken markdown reference.

Forbidden actions:
- git add / commit / push
- GitHub repository or release creation
- deploy
- external API calls
- production or external DB connection
- real secret generation or credential transmission
- App Store/TestFlight operations
- docker compose down -v

Human confirmation rules:
Before any real-world side effect, present target, operation details, impact scope, and rollback plan. Wait for explicit approval.

Output format:
1. Current phase status
2. Files reviewed
3. Issues found
4. Secret/privacy result
5. Safety rule result
6. Recommended next action
```
