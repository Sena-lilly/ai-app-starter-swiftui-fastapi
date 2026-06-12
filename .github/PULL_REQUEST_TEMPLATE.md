# Summary

Describe the change in a few sentences.

## Scope

- [ ] Backend
- [ ] iOS
- [ ] Docker/PostgreSQL
- [ ] Docs
- [ ] CI
- [ ] Codex workflow
- [ ] Examples
- [ ] Release readiness

## Tests Run

List commands run locally.

```text

```

## Screenshots / Recordings

Add screenshots for UI changes when useful.

## Safety Checklist

- [ ] No real secrets, API keys, tokens, private keys, Apple credentials, or production URLs were added.
- [ ] `.env` was not committed and `.env.example` contains placeholders only.
- [ ] No production or external database was contacted.
- [ ] No real user data was written, copied, or deleted.
- [ ] No deploy, GitHub release, tag, App Store/TestFlight upload, or paid billing operation was performed.
- [ ] `docker compose down -v` or Docker volume deletion was not performed without explicit human confirmation.
- [ ] Side-effect operations, if any are proposed, include target, operation details, impact scope, and rollback plan.

## Secret Audit

- [ ] `scripts/secret-audit.sh` passed, or an equivalent manual audit was documented.

## DB / Docker Impact

Describe any migration, Compose, volume, or local data impact.

## iOS Impact

Describe simulator/device impact, signing impact, and App Store/TestFlight impact. Use `None` if not applicable.

## AI-Assisted Change Disclosure

If Codex or another AI coding assistant helped, summarize what it changed and what a human reviewed.

