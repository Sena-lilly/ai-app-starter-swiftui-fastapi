# Codex Review Workflow Example

Use review prompts after implementation and before public changes.

## Security Review

Use:

```text
templates/codex-security-review.md
```

Review:

- secrets
- `.env.example`
- generated artifacts
- unsafe automation instructions
- public-repo readiness

## Docker/PostgreSQL Review

Use:

```text
templates/codex-docker-postgres-review.md
```

Review:

- localhost-only bindings
- placeholder credentials
- Alembic migration
- fake local auth smoke
- cleanup with `docker compose down`

Never run `docker compose down -v` without explicit approval.

## Release Readiness Review

Use:

```text
templates/codex-release-check.md
```

Review:

- README status
- tests/builds
- secret audit
- release notes draft
- issue triage

Do not create a release during review.

## No External Side Effects

Reviews must not:

- push commits
- create GitHub issues or comments
- deploy
- call external APIs
- connect to production/external databases
- write real user data
