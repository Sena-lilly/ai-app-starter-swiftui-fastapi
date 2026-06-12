# Release Readiness Flow Example

This example prepares for a future release without creating one.

## Checklist

1. Review `progress.md`.
2. Review `docs/release-checklist.md`.
3. Run backend tests.
4. Run iOS build.
5. Run Docker/PostgreSQL local check when Docker is available.
6. Run secret audit.
7. Review docs and examples.
8. Draft release notes.
9. Draft issue updates.
10. Ask for explicit human confirmation before any tag, release, or push.

## Commands

```bash
scripts/local-verify-backend.sh
scripts/local-verify-ios.sh
scripts/secret-audit.sh
```

Optional local Docker check:

```bash
scripts/local-verify-docker.sh
```

## Release Notes Draft Shape

```text
## Summary

## Verification

## Known limitations

## Safety notes

## Rollback plan
```

## Important Boundary

This flow does not create a GitHub release, push commits, upload to App Store/TestFlight, deploy, or connect to production systems.
