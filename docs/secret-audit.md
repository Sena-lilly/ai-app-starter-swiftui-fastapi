# Secret Audit

Use this checklist before commits, public pushes, release candidates, and issue updates that include logs.

## Must Not Be Committed

- Real API keys
- Real JWT signing secrets
- Passwords
- Private keys
- Apple developer credentials
- Production URLs
- Production database URLs
- Real user data
- Local SQLite/PostgreSQL database files
- `.env`
- `.venv`
- `ios/.DerivedData`
- `.DS_Store`
- `__pycache__`
- `.pytest_cache`
- logs or build artifacts

## Allowed

- `.env.example` with placeholder values only
- fake local accounts such as `p8-preflight@example.com`
- localhost URLs
- placeholder Docker credentials documented as local-only

## Manual Checks

From the repository root:

```bash
scripts/secret-audit.sh
git status --short
```

If `.env` exists locally, do not print its contents. Confirm it is ignored and not staged.

## Notes

The audit script intentionally uses simple checks. It is a release-readiness aid, not a full secret scanning replacement.
