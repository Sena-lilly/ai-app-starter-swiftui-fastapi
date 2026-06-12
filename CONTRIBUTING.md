# Contributing

Thank you for your interest in contributing to `ai-app-starter-swiftui-fastapi`.

This project is phase-driven. It is currently completed through P8-B Release Candidate Preflight locally and remains pre-v0.1.0. Contributions should match the active roadmap phase and avoid presenting unfinished local-development features as production-ready.

## Development principles

- Keep changes small and reviewable.
- Prefer documentation-first planning before implementation.
- Use local-only work unless a maintainer explicitly approves an external action.
- Avoid adding real secrets, credentials, tokens, production URLs, or private keys.
- Use placeholders and `.env.example` for future configuration examples.
- Favor test-first implementation once code phases begin.
- Match the existing repository style and phase roadmap.
- If you use Codex or another AI coding assistant, follow [CODEX.md](CODEX.md).

## Safety requirements

Do not ask automation tools to perform real-world side-effect operations without explicit human confirmation.

Examples requiring confirmation include:

- Creating repositories
- Committing or pushing changes
- Creating releases
- Deploying services
- Calling external APIs
- Connecting to production databases
- Writing real production data
- Deleting real user data
- Generating or transmitting authentication credentials
- Triggering paid billing operations

Before any such operation, document:

- Target
- Payload or operation details
- Impact scope
- Rollback plan

## Pull request expectations

Pull requests should include:

- A concise summary
- The related roadmap phase
- Testing or verification performed
- Security considerations, when relevant
- AI-assisted change notes, when relevant
- Any known limitations

## Phase discipline

The roadmap is intentionally incremental:

- P0 creates the repository foundation.
- P1 starts the backend MVP.
- P2 starts the iOS MVP.
- P3 adds the authentication flow.
- P4 adds Docker and local PostgreSQL.
- P5 adds Codex-safe workflow integration.
- Later phases add broader tests, examples, and release readiness.

Please avoid skipping ahead unless the roadmap has been updated first.
