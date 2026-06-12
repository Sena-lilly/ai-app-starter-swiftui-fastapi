# Security Policy

Security is a core design concern for this starter kit. The project is intended for mobile apps that may eventually handle user accounts, tokens, personal data, and production infrastructure.

## Current status

This repository is currently completed through P8-B Release Candidate Preflight locally and remains pre-v0.1.0. It contains local development backend, iOS auth, local-only Docker/PostgreSQL code, AI-agent workflow guidance, CI/release-readiness docs, examples, release-prep drafts, and local hardening checks, but it is not production-ready and does not contain production configuration.

## Secret handling

Do not commit real secrets.

Never include:

- API keys
- Access tokens
- Passwords
- Private keys
- Apple developer credentials
- Production URLs
- Production database connection strings
- JWT signing secrets
- OAuth client secrets

Use `.env.example` for future placeholder configuration examples. Real `.env` files must remain local and ignored by Git.

## Reporting security issues

Until a public security contact is established, please avoid publishing exploit details in public issues. Open a minimal issue stating that a security-sensitive report exists, or contact the maintainer through the available project profile.

## Codex and automation safety

Codex, scripts, CI jobs, and other automation must not perform real-world side-effect operations without explicit human confirmation.

AI-assisted changes should follow [CODEX.md](CODEX.md). Report reusable prompt patterns or automation instructions that could cause unsafe production access, credential exposure, destructive database actions, or unreviewed external side effects.

Operations requiring confirmation include:

- Deployments
- External API calls
- Production database connections
- Real database writes
- Real user data deletion
- Credential generation or transmission
- Paid billing operations
- App Store or TestFlight operations
- Production configuration changes

Before performing any such operation, document:

- Target
- Payload or operation details
- Impact scope
- Rollback plan

## Future security work

Future phases should add:

- Authentication threat model
- Password hashing policy
- JWT signing and rotation strategy
- Refresh token storage rules
- iOS Keychain storage guidance
- CORS and transport security policy
- Dependency scanning
- Release security checklist
