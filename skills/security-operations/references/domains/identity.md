# Identity, passwords, MFA, social media accounts

## Password policy (aligned with NIST SP 800-63B; verify current revision)
- Length over complexity: minimum 12–15 characters for users, allow long passphrases (64+), all characters including spaces.
- **Check against breached-password lists** at creation/change; no forced periodic rotation unless compromise is suspected.
- No password hints or knowledge-based questions. Rate-limit and lock out progressively; alert on credential stuffing patterns.
- Encourage a password manager (Bitwarden, KeePassXC, 1Password, built-in platform managers).

## Password checker — safe ways
- **Never ask the user to type a password into chat.**
- Breach check without revealing the password: k-anonymity range APIs (e.g. Have I Been Pwned "Pwned Passwords": send only the first 5 hex chars of the SHA-1 hash, compare locally). Run locally, on the user's machine.
- Strength estimate locally with zxcvbn-class libraries.
- Audit stored passwords in code/config: hashing must be Argon2id, scrypt or bcrypt with proper cost — never plain, reversible encryption, MD5/SHA1/unsalted SHA-256.
- Audit a password manager vault with its own built-in health/breach report.

## MFA
Phishing-resistant (passkeys/FIDO2 security keys) for admins and finance; authenticator apps for others; SMS only as a last resort.
Recovery codes stored offline. Number matching / anti-MFA-fatigue settings on push.

## Access hygiene
Joiner/mover/leaver process; quarterly access reviews; separate admin accounts; break-glass accounts stored offline and monitored;
OAuth app consent restricted; service accounts with scoped keys and rotation.

## Social media account security
- Business accounts managed through official business managers (Meta Business Suite, LinkedIn Page admins, etc.) with **roles**, never shared passwords.
- MFA (preferably security keys) on every admin; at least two admins for recovery; recovery email/phone on a company-controlled address.
- Review connected third-party apps and remove unused ones; limit scheduler tools' permissions.
- Watch for impersonation accounts and phishing DMs ("copyright violation", "verification badge") — report via platform channels.
- Account takeover plan: platform recovery links bookmarked, ID/business documents ready, comms template prepared.
