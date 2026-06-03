# Codex Workflow

This repository is designed to be friendly to Codex-assisted development.

The goal is not to let automation act without oversight. The goal is to make useful local changes easier to review, test, and explain.

## Relationship with codex-app-workflow

This project is related to [codex-app-workflow](https://github.com/Sena-lilly/codex-app-workflow).

`codex-app-workflow` is a workflow kit for using Codex safely in app development.

`ai-app-starter-swiftui-fastapi` applies those ideas to a concrete SwiftUI + FastAPI + PostgreSQL starter kit.

This project should remain independent. Developers can use it without cloning or depending on `codex-app-workflow`.

## Recommended Codex operating mode

Ask Codex to:

- Inspect before editing.
- Explain assumptions.
- Keep diffs small.
- Prefer local-only changes.
- Add or update tests when implementation begins.
- Avoid creating real credentials.
- Avoid external side effects without confirmation.
- Summarize files changed and verification performed.

## Required confirmation before side effects

Codex must ask for explicit human confirmation before:

- Creating a GitHub repository
- Running `git init`
- Running `git commit`
- Running `git push`
- Creating a GitHub release
- Deploying
- Calling external APIs
- Using App Store Connect or TestFlight
- Connecting to production databases
- Writing real database records
- Deleting real user data
- Generating or transmitting credentials
- Triggering paid billing operations
- Changing production configuration

Before asking for approval, Codex should present:

- Target
- Payload or operation details
- Impact scope
- Rollback plan

## Suggested prompt flow

1. Start with an audit prompt.
2. Ask for a phase-specific implementation plan.
3. Implement the smallest useful slice.
4. Run local verification.
5. Ask for review before external operations.

Prompt templates are available in [../templates](../templates).
