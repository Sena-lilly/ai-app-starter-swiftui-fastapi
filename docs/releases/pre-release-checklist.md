# Pre-Release Checklist

Use this checklist before any v0.1.0 tag or GitHub release is created.

## Verification

- [ ] Run backend tests: `scripts/local-verify-backend.sh`
- [ ] Run iOS simulator build: `scripts/local-verify-ios.sh`
- [ ] Run secret audit: `scripts/secret-audit.sh`
- [ ] Run shell syntax check: `bash -n scripts/*.sh`
- [ ] Run Markdown link check: `python3 scripts/check-markdown-links.py`
- [ ] Run preflight script: `scripts/preflight-local.sh`
- [ ] Run Docker/PostgreSQL verification when Docker is available: `scripts/preflight-local.sh --with-docker`
- [ ] Confirm Alembic migration applies with `alembic upgrade head`.
- [ ] Confirm `GET /health` returns `status: ok`.
- [ ] Confirm fake local auth smoke uses fake credentials only.

## Repository Hygiene

- [ ] Confirm no `.env` file is staged or committed.
- [ ] Confirm `.env.example` contains placeholders only.
- [ ] Confirm no real API keys, JWT secrets, passwords, private keys, Apple credentials, production URLs, or production DB URLs are present.
- [ ] Confirm no local SQLite DB files, Docker volumes, DerivedData, `.venv`, caches, logs, or build artifacts are included.
- [ ] Confirm README status matches `progress.md`.
- [ ] Confirm docs do not overclaim production readiness.
- [ ] Confirm `CHANGELOG.md` and release notes draft are current.

## CI / GitHub

- [ ] Confirm backend CI workflow uses SQLite default tests only.
- [ ] Confirm docs/script CI workflow does not fetch external URLs.
- [ ] Confirm iOS CI workflow builds without signing.
- [ ] Confirm workflows require no secrets.
- [ ] Confirm Issue and PR templates are appropriate for a public repository.
- [ ] Confirm GitHub Issues are triaged or issue update drafts are ready.

## Safety

- [ ] Confirm no production DB or external DB was contacted.
- [ ] Confirm no real user data was used.
- [ ] Confirm no App Store/TestFlight operation was performed.
- [ ] Confirm no deploy was performed.
- [ ] Confirm `docker compose down -v` was not used.
- [ ] Confirm no GitHub release or tag has been created yet.
- [ ] Confirm Ruff/SwiftFormat are either configured and passing or explicitly deferred.

## Human Confirmation Required

Before tag, release, push, deploy, or any external operation, document:

- target repository or system
- operation details
- impact scope
- rollback plan

Then wait for explicit human approval.
