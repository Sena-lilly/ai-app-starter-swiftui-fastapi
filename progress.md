# Project Progress

This file tracks the phase roadmap for `ai-app-starter-swiftui-fastapi`.

## P0 Repository Bootstrap

- [x] Create root documentation files
- [x] Create docs folder and planning documents
- [x] Create placeholder `ios/` folder
- [x] Create placeholder `backend/` folder
- [x] Create Codex prompt templates
- [x] Add MIT License
- [x] Add safety and security rules
- [x] Document relationship with `codex-app-workflow`
- [x] Review P0 docs for bootstrap handoff readiness

## P1 Backend MVP

- [x] Create FastAPI project structure
- [x] Add health check endpoint
- [x] Add configuration loading with placeholder `.env.example`
- [x] Add database connection preparation without requiring a live DB
- [x] Add initial test setup
- [x] Add local backend run instructions
- [x] Keep JWT/auth, Docker, migrations, and iOS implementation deferred

## P2 iOS MVP

- [x] Create SwiftUI project
- [x] Add app shell
- [x] Add Home screen
- [x] Add Login and Signup placeholders
- [x] Add API client foundation with health-check call
- [x] Add environment configuration pattern
- [x] Add basic error handling foundation
- [x] Add local backend connectivity notes
- [x] Add simulator build and launch smoke verification path

## P3 Auth Flow

- [x] Complete P3 auth design pass
- [x] Define auth API contract
- [x] Propose local DB, JWT, error, and test strategy
- [x] Add iOS token storage guidance
- [x] P3-A Backend Auth MVP
- [x] Implement password hashing policy
- [x] Implement JWT access token flow
- [x] Add backend auth tests
- [x] P3-B iOS Auth MVP
- [x] Add iOS token storage implementation
- [x] Add login/signup request handling
- [x] Add authenticated state and logout
- [x] P3-C Integration Review

## P4 Docker Local Setup

- [x] Add Dockerfile for backend
- [x] Add Docker Compose configuration
- [x] Add PostgreSQL local service
- [x] Add migration workflow
- [x] Add local reset instructions with safety warnings
- [ ] Add Docker troubleshooting notes
- [ ] Complete P4-B Docker/PostgreSQL integration review

## P5 Codex Workflow Integration

- [ ] Add Codex task prompts for common changes
- [ ] Add implementation guardrails
- [ ] Add review and dry-run checklists
- [ ] Add workflow examples based on `codex-app-workflow`
- [ ] Ensure this repository remains independently usable

## P6 Testing / Release Readiness

- [ ] Add backend test suite
- [ ] Add iOS test plan
- [ ] Add linting and formatting guidance
- [ ] Add CI design or implementation
- [ ] Complete security checklist
- [ ] Complete release checklist

## P7 Examples

- [ ] Add example app flow
- [ ] Add example authenticated request
- [ ] Add example backend endpoint
- [ ] Add example iOS screen
- [ ] Add example Codex task walkthrough

## P8 v0.1.0 Public Release

- [ ] Finalize README
- [ ] Finalize docs
- [ ] Verify no secrets or production config exist
- [ ] Run release checklist
- [ ] Prepare changelog
- [ ] Create v0.1.0 release only after explicit human confirmation
