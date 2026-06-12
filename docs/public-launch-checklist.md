# Public Launch Checklist

Use this before announcing or linking the public repository broadly.

## Repository Presentation

- [ ] README clearly states current status.
- [ ] README says production-minded, not production-ready.
- [ ] About text and topics match the stack.
- [ ] License is present.
- [ ] Security policy is present.
- [ ] Contributing guide is present.
- [ ] Code of conduct is present.
- [ ] Known limitations are linked.
- [ ] Examples are easy to find.
- [ ] Architecture diagram renders in README/docs.
- [ ] Screenshots are either reviewed and linked or intentionally represented by a capture guide.

## GitHub Setup

- [ ] Issues are enabled if maintainers want public feedback.
- [ ] Issue templates are present.
- [ ] Pull request template is present.
- [ ] Actions tab shows backend and iOS workflows after push.
- [ ] Docs/script checks are visible after push.
- [ ] Label design is available in [maintenance/github-labels.md](maintenance/github-labels.md) or configured manually.
- [ ] Branch protection is considered after the first public CI run.
- [ ] No private contact information is added to templates.

## Safety

- [ ] `.env` is ignored.
- [ ] `.env.example` uses placeholders only.
- [ ] No real secrets, credentials, production URLs, or real user data are present.
- [ ] Docker/PostgreSQL docs are local-only.
- [ ] App Store/TestFlight is not presented as configured.
- [ ] Release/tag creation requires explicit human confirmation.

## Public Messaging

- [ ] Position as an early SwiftUI + FastAPI starter kit.
- [ ] Mention Codex workflow support as optional guidance.
- [ ] Avoid saying production-ready.
- [ ] Avoid promising security guarantees beyond local starter practices.
- [ ] Link to roadmap and known limitations.
