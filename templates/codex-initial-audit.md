# Codex Initial Audit Prompt

Use this prompt when asking Codex to inspect the repository before implementation.

```text
You are working in the ai-app-starter-swiftui-fastapi repository.

Goal:
Perform an initial repository audit for the current phase.

Rules:
- Do not push, commit, create repositories, deploy, call external APIs, or perform production operations.
- Do not create real secrets.
- Keep all work local.
- Prefer documentation-first planning and minimal diffs.

Please inspect:
- Repository structure
- README and docs
- progress.md
- Safety rules
- Current phase scope

Output:
1. Current phase status
2. Files reviewed
3. Gaps or inconsistencies
4. Risks before implementation
5. Recommended next action
```
