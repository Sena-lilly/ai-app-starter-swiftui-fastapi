# Codex Session Handoff Prompt

Use this prompt when ending a long task or preparing another Codex session to continue.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Purpose:
Create a concise handoff for the next session.

Scope:
- Summarize what changed, what was verified, what remains risky, and what should happen next.
- Do not implement new work.

Files to inspect:
- progress.md
- README.md
- CODEX.md
- Recent files changed in the current task
- Relevant docs for the current phase

Allowed actions:
- Read files.
- Run local inspection commands.
- Clean generated local artifacts when clearly safe.

Forbidden actions:
- git add / commit / push
- release or deploy
- external API calls
- production or external DB connection
- real data writes/deletion
- docker compose down -v without explicit approval

Human confirmation rules:
Before any real-world side effect, present target, operation details, impact scope, and rollback plan.

Output format:
1. Current objective
2. Completed work
3. Files changed
4. Verification performed
5. Cleanup performed
6. Known blockers
7. Exact recommended next prompt
```
