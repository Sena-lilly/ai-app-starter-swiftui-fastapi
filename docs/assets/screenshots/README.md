# Screenshot Capture Guide

This folder is reserved for README screenshots and local demo assets.

Do not add screenshots that include real credentials, real user data, production URLs, Apple credentials, tokens, or private local paths.

## Target Assets

Recommended first pass:

- `01-home.png` - app home screen before any request
- `02-health-check.png` - successful local `/health` check
- `03-signup.png` - signup form with fake local account only
- `04-login.png` - login form with fake local account only
- `05-authenticated.png` - authenticated session state after `/users/me`

Optional later asset:

- `../demo/auth-flow.gif` - short local-only auth flow recording

## Fake Local Account

Use only fake local credentials, for example:

```text
screenshot-demo@example.com
```

Do not use a real email/password pair.

## Local Capture Flow

1. Start the backend locally.
2. Build and launch the iOS app on a local Simulator.
3. Capture screens with `simctl` or Xcode.
4. Review every image before committing it.
5. Confirm no secrets, local private paths, tokens, or real user data are visible.

Example local commands, adjusted for your simulator:

```bash
scripts/local-verify-backend.sh
scripts/local-verify-ios.sh

/Applications/Xcode.app/Contents/Developer/usr/bin/simctl list devices available
/Applications/Xcode.app/Contents/Developer/usr/bin/simctl boot "iPhone 17 Pro"
/Applications/Xcode.app/Contents/Developer/usr/bin/simctl io booted screenshot docs/assets/screenshots/01-home.png
```

If Simulator capture is unstable, leave README image links out and keep this folder as a documented capture plan.
