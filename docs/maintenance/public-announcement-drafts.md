# Public Announcement Drafts

Use these after `v0.1.0` is published. Do not post them automatically from Codex.

## GitHub Release Announcement Short

`ai-app-starter-swiftui-fastapi` v0.1.0 is out.

It is a production-minded, not production-ready, starter kit for indie developers building SwiftUI + FastAPI apps with JWT auth, Keychain token storage, Docker/PostgreSQL local development, Alembic migrations, CI, examples, and Codex-safe workflow docs.

Release notes: `https://github.com/Sena-lilly/ai-app-starter-swiftui-fastapi/releases/tag/v0.1.0`

## X / Twitter Post - Japanese

SwiftUI + FastAPI + PostgreSQL + JWT auth のスターターキット `ai-app-starter-swiftui-fastapi` v0.1.0 を公開しました。

普通の starter kit だけでなく、Codex / AI coding agent に安全に触らせるための workflow docs、review templates、release readiness、CI、examples も含めています。

production-minded ですが production-ready ではありません。個人開発者が local-first に試せる OSS baseline です。

## X / Twitter Post - English

Released `ai-app-starter-swiftui-fastapi` v0.1.0.

A production-minded, not production-ready, starter kit for indie developers building SwiftUI + FastAPI apps with JWT auth, Keychain token storage, Docker/PostgreSQL local dev, Alembic, CI, examples, and Codex-safe workflow docs.

The goal: make AI-agent-assisted app development safer and more reviewable.

## Zenn / Qiita Intro Draft - Japanese

### SwiftUI + FastAPI アプリ開発スターターキットを v0.1.0 として公開しました

`ai-app-starter-swiftui-fastapi` は、個人開発者が SwiftUI + FastAPI + PostgreSQL + JWT auth の構成でアプリを作り始めるための OSS starter kit です。

この repository の特徴は、単に backend/iOS/Docker を置いているだけではなく、Codex や AI coding agents に安全に作業させるための workflow docs、prompt templates、review checklist、release readiness、secret audit を含めていることです。

v0.1.0 では以下を含みます。

- SwiftUI app shell
- iOS auth flow
- Keychain token storage
- FastAPI backend
- `/health`, signup, login, `/users/me`
- JWT auth and password hashing
- SQLite default tests
- Docker Compose + PostgreSQL local development
- Alembic initial migration
- GitHub Actions CI foundation
- Codex-safe workflow docs/templates
- examples and release readiness docs
- lightweight iOS XCTest foundation

production-minded ですが production-ready ではありません。production deploy、refresh token、email verification、password reset、OAuth、roles、App Store/TestFlight automation などは今後の範囲です。

## README Tagline Alternatives

- A production-minded SwiftUI + FastAPI starter kit with Codex-safe workflows.
- A local-first iOS app starter for indie developers using SwiftUI, FastAPI, JWT auth, PostgreSQL, and Codex.
- A safer AI-agent-friendly starter kit for SwiftUI + FastAPI app development.
- SwiftUI + FastAPI + PostgreSQL, with release discipline and Codex guardrails built in.

## Codex for OSS Context Note

This repository is a good Codex for OSS example because it treats AI coding agents as part of the development workflow rather than an afterthought. The project includes explicit human-confirmation rules, local-only verification scripts, secret-audit guidance, release-readiness docs, and reusable prompt templates for implementation and review passes.

It is intentionally honest about being production-minded, not production-ready.
