# Codex Security Review Prompt

Use this prompt for security and public-repository safety reviews.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Purpose:
Review the repository for security, privacy, and unsafe automation risks.

Scope:
- Check docs, templates, config examples, backend, iOS, Docker, and generated artifacts.
- Fix only clear security documentation or placeholder-safety issues.

Files to inspect:
- CODEX.md
- AGENTS.md
- SECURITY.md
- README.md
- .env.example
- .gitignore
- .dockerignore
- docs/
- backend/
- ios/
- templates/

Allowed actions:
- Run local secret-pattern searches.
- Run generated artifact checks.
- Update docs/templates for safety clarity.

Forbidden actions:
- generating secrets
- testing real credentials
- production or external DB connection
- external API calls
- deploy/release/git push
- App Store/TestFlight operations
- docker compose down -v

Human confirmation rules:
Before any real-world side effect, present target, operation details, impact scope, and rollback plan.

Output format:
1. Security review result
2. Secret/privacy audit
3. Generated artifact result
4. Unsafe workflow patterns
5. Files changed, if any
6. Blocking issues
7. Recommended next action
```
