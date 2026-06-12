# Roadmap

The project roadmap is intentionally phase-based. Each phase should be small enough to review and verify.

## P0 Repository Bootstrap

Create repository structure, docs, safety rules, roadmap, and Codex prompt templates. Avoid full implementation.

## P1 Backend MVP

Create the initial FastAPI backend skeleton with a health check endpoint, basic configuration loading, and tests.

## P2 iOS MVP

Create the SwiftUI project shell with a minimal app flow and placeholder API client.

## P3 Auth Flow

Add authentication design and implementation across backend and iOS, including JWT access tokens and secure iOS token storage.

## P4 Docker Local Setup

Add Docker Compose for local development, including PostgreSQL and backend service support.

## P5 Codex Workflow Integration

Add more detailed Codex prompts, dry-run workflows, review checklists, role templates, handoff templates, and examples inspired by `codex-app-workflow`.

## P6 Testing / Release Readiness

Add broader test coverage, linting and formatting guidance, CI configuration, secret-audit guidance, local verification scripts, and release readiness checks.

## P7 Examples

Add example app flows and walkthroughs showing how to use and extend the starter kit.

## P8 v0.1.0 Public Release

Prepare the first public release after documentation, tests, security review, and explicit human approval.

P8-A Release Preparation may happen before the actual release. It includes changelog drafting, release notes drafting, GitHub templates, pre-release checklists, CI hardening, and local preflight tooling.

P8-B Release Candidate Preflight may happen after P8-A. It includes backend test hardening, docs/script CI checks, script hardening, docs navigation polish, and final local preflight review.

A public polish pass may happen before the final tag. It includes README positioning, architecture diagrams, screenshot/demo capture guidance, GitHub issue/label drafts, and a lightweight local-only iOS XCTest target.

The actual v0.1.0 tag and GitHub release remain pending until a human explicitly approves them.
