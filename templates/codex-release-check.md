# Codex Release Check Prompt

Use this prompt before any future public release.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Goal:
Perform a release readiness check.

Rules:
- Do not create a GitHub release.
- Do not commit or push.
- Do not deploy.
- Do not call external APIs.
- Do not modify production configuration.
- Do not generate or transmit credentials.

Review:
- README.md
- progress.md
- docs/release-checklist.md
- SECURITY.md
- Repository file tree
- Secret-safety risks
- Test and verification status

Output:
1. Release readiness status
2. Blocking issues
3. Non-blocking issues
4. Secret scan notes
5. Tests or checks run
6. Required human confirmations before release
7. Rollback considerations
```
