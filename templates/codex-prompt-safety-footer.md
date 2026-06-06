# Codex Prompt Safety Footer

Append this section to future Codex prompts for this repository.

Purpose:

- Provide a reusable safety block for future Codex prompts.

Scope:

- Use this as an appendix to implementation, review, audit, release, and handoff prompts.

Files to inspect:

- `CODEX.md`
- `docs/codex-workflow.md`
- Relevant phase docs for the prompt

Allowed actions:

- Copy this footer into a prompt.
- Adapt wording only to make the prompt more specific.

Forbidden actions:

- Removing side-effect confirmation rules.
- Weakening database, Docker, Git, release, deploy, credential, billing, or App Store/TestFlight restrictions.

Human confirmation rules:

- Any real-world side-effect operation must present target, operation details, impact scope, and rollback plan before execution.

```text
Safety restrictions:
- Do not run git add, git commit, or git push unless explicitly instructed.
- Do not create GitHub repositories, tags, or releases.
- Do not deploy.
- Do not call external APIs.
- Do not connect to production or external databases.
- Do not write, modify, or delete real user data.
- Do not generate, store, or transmit real credentials.
- Do not perform App Store or TestFlight operations.
- Do not trigger paid billing operations.
- Do not change production configuration.
- Do not run docker compose down -v or delete Docker volumes without explicit approval.

Local-only work allowed:
- Read and edit files inside the repository.
- Run local tests and build checks.
- Use SQLite local tests.
- Use Docker/PostgreSQL only with placeholder credentials and fake local accounts.
- Stop local containers with docker compose down.

Before any real-world side-effect operation, present:
- target endpoint or target system
- request body or operation details
- impact scope
- rollback plan

Output format:
1. Files changed
2. Summary
3. Verification
4. Safety result
5. Risks or missing items
6. Recommended next action
```
