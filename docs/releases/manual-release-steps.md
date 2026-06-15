# Manual Release Steps

This document is a human-run checklist for publishing `v0.1.0`.

Codex must not create tags, push tags, create GitHub releases, publish artifacts, deploy, or operate GitHub Issues/Labels. These steps are instructions for a human maintainer only.

## Preconditions

Before creating a tag or release, confirm:

- Working tree is clean.
- GitHub Actions are green for the release commit.
- Backend tests pass.
- iOS simulator build passes.
- Secret audit passes.
- Markdown link check passes.
- Shell script syntax check passes.
- Docker/PostgreSQL local verification passes, or any skipped local preflight is explicitly documented.
- No `.env`, local DB files, DerivedData, caches, logs, private keys, Apple credentials, production URLs, or real secrets are present.
- `CHANGELOG.md`, `docs/releases/v0.1.0-draft.md`, and README status are reviewed.
- The project is still described as production-minded, not production-ready.

Recommended local commands:

```bash
git status --short
bash scripts/secret-audit.sh
bash -n scripts/*.sh
python3 scripts/check-markdown-links.py
scripts/local-verify-backend.sh
scripts/local-verify-ios.sh
scripts/local-verify-ios-tests.sh --build-for-testing
docker compose config
```

Optional Docker runtime preflight:

```bash
scripts/local-verify-docker.sh
```

Do not run `docker compose down -v` unless you explicitly intend to delete the local PostgreSQL volume.

## Tag Creation

Human-only commands:

```bash
git status --short
git tag v0.1.0
git push origin v0.1.0
```

Before pushing the tag, confirm:

- Target: `Sena-lilly/ai-app-starter-swiftui-fastapi`
- Operation: create and push annotated or lightweight tag `v0.1.0`
- Impact scope: public release marker for the repository
- Rollback plan: delete the local/remote tag only if absolutely necessary and after explicit human review

## GitHub Release Creation

Create the release manually in the GitHub UI:

- Repository: `Sena-lilly/ai-app-starter-swiftui-fastapi`
- Tag: `v0.1.0`
- Title: `v0.1.0 - SwiftUI + FastAPI starter kit baseline`
- Body: use `docs/releases/v0.1.0-draft.md`
- Mark as latest release only if the maintainer agrees this is the public baseline.

Do not attach files containing secrets, local database files, DerivedData, `.env`, logs, or private machine paths.

## Post-Release Checks

After the release is published:

- Open the release page and confirm title, tag, body, and links.
- Confirm README badges still resolve.
- Confirm GitHub Actions status is visible and green.
- Update relevant GitHub Issues manually, using `docs/maintenance/github-issue-updates.md` and `docs/releases/post-release-update-draft.md`.
- Consider submitting the updated Codex for OSS note from `docs/maintenance/codex-for-oss-updated-submission.md`.
- Apply the post-release README/CHANGELOG/progress draft if appropriate.

## Rollback Note

If the GitHub Release is still a draft, it can be deleted from the GitHub UI before publishing.

If the release has been published, treat rollback as a public project event:

- Do not force-push or delete tags casually.
- Document the reason.
- Consider publishing a patch release instead.
- If tag deletion is truly needed, require explicit human confirmation with target, operation details, impact scope, and rollback/recovery plan.
