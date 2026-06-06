# Codex iOS Implementation Prompt

Use this prompt for iOS work in the active roadmap phase.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Purpose:
Implement the next SwiftUI task while preserving local-only development safety.

Scope:
- Stay within the requested milestone.
- Keep APIClient, AppConfig, auth state, and docs aligned.
- Do not expand auth/security features beyond the prompt.

Files to inspect:
- CODEX.md
- ios/README.md
- ios/AiAppStarter/
- docs/ios-design.md
- docs/auth-design.md, if auth is involved
- progress.md

Allowed actions:
- Edit iOS source for the requested phase.
- Run Xcode build or simulator smoke checks when available.
- Use fake local accounts for local testing.

Forbidden actions:
- App Store Connect or TestFlight operations
- Apple credentials
- production URLs
- real credentials
- git add / commit / push
- deploy, release, or external API calls

Human confirmation rules:
Before any App Store, TestFlight, credential, external service, or production configuration action, present target, operation details, impact scope, and rollback plan.

Output format:
1. Files changed
2. iOS implementation summary
3. Build/smoke checks
4. Commands run
5. Secret/safety result
6. Remaining risks
7. Recommended next action
```
