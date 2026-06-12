# Examples

These examples show how to use and extend `ai-app-starter-swiftui-fastapi` during local development.

Use fake local accounts only. Do not use real credentials, production databases, external services, App Store/TestFlight, or billing systems.

## Example Guides

- [Backend auth flow](backend-auth-flow.md)
- [iOS auth flow](ios-auth-flow.md)
- [Docker/PostgreSQL local workflow](docker-postgres-local.md)
- [Codex feature implementation workflow](codex-feature-implementation.md)
- [Codex review workflow](codex-review-workflow.md)
- [Release readiness flow](release-readiness-flow.md)

## Safety Reminder

Local examples may write fake local test data to SQLite or local Docker PostgreSQL.

Do not run:

```bash
docker compose down -v
```

unless you explicitly intend to delete the local PostgreSQL test volume.
