# Codex Feature Implementation Example

This example shows a safe Codex workflow for adding a small feature.

## 1. Planning Pass

Ask Codex to inspect the relevant files and propose the smallest safe change.

Example:

```text
Review CODEX.md, docs/backend-design.md, backend/README.md, and progress.md.
Propose a minimal implementation plan for the next backend feature.
Do not edit files yet.
```

## 2. Implementation Pass

Ask for one scoped change.

```text
Implement the approved backend feature.
Keep the diff minimal.
Do not connect to production or external databases.
Use local tests only.
```

## 3. Review Pass

Ask Codex to review the implemented slice.

```text
Review the changed files for bugs, scope creep, missing tests, and safety issues.
Fix only clear issues.
```

## 4. Runtime Verification

Run local checks:

```bash
scripts/local-verify-backend.sh
scripts/secret-audit.sh
```

Use iOS or Docker verification only when the feature touches those areas.

## 5. Handoff

End with:

- files changed
- tests run
- generated artifacts cleaned
- risks
- recommended next prompt

## Human Confirmation Rules

Stop and ask before:

- git push
- release creation
- deploy
- external API calls
- production DB access
- real user data mutation
- credential generation/transmission
- `docker compose down -v`
