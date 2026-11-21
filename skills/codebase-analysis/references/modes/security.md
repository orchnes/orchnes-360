# Mode: Security review

Defensive review of code the user owns or is authorized to assess. Report findings; do not exploit live systems.

## 1. Automated sweep (use what's installed)
| Area | Tools |
|---|---|
| Leaked secrets | gitleaks, trufflehog (include git history) |
| Dependencies | npm audit, pip-audit, govulncheck, cargo audit, osv-scanner, Trivy |
| Static analysis | Semgrep, CodeQL, Bandit, gosec, Brakeman |
| Containers / IaC | Trivy, Checkov, hadolint |
Fallback secret grep: `rg -n -i '(api[_-]?key|secret|password|token|private[_-]?key)\s*[:=]\s*["\x27][^"\x27]{8,}'`
and look for committed `.env`, `*.pem`, `id_rsa`, credentials JSON.
Verify each tool hit manually — report confirmed issues, not raw scanner output.

## 2. Manual review: follow untrusted input (source → sink)
Sources: HTTP params/body/headers, files, uploads, env, queue messages, DB data from users, CLI args, device input.
Sinks to check:
| Sink | Risk |
|---|---|
| SQL/NoSQL query building | injection |
| Shell/exec/eval | command/code injection |
| HTML rendering | XSS |
| File paths | path traversal |
| Outbound URL fetch | SSRF |
| Deserialization | RCE |
| Redirects | open redirect |
| Logs | sensitive data exposure, log injection |

## 3. Checklist
- **AuthN:** password hashing (bcrypt/argon2), session/token expiry, MFA where needed.
- **AuthZ:** every endpoint/action checks ownership and role on the server (IDOR is the most common real bug).
- **Crypto:** no homemade crypto, no MD5/SHA1 for passwords, TLS enforced, secure randomness.
- **Config:** debug off in prod, CORS not `*` with credentials, security headers, cookies `Secure/HttpOnly/SameSite`.
- **Data:** PII minimized and encrypted where required; secrets from a vault/env, not code.
- **Dependencies:** pinned, maintained, no known critical CVEs; lockfile committed.
- **Infra:** least-privilege IAM, no public buckets, containers not running as root.
- **Rate limiting & abuse:** login, signup, expensive endpoints, LLM/API usage.

## Report template
```markdown
## Security
**Scope:** <what was reviewed, tools run>   **Verdict:** <one line>

| # | Severity | Finding | Location | Evidence | Fix |
|---|---|---|---|---|---|
| 1 | Critical | SQL injection in order search | `api/orders.py:88` | f-string query with `q` param | parameterized query |

Severity: Critical (remote compromise/data breach) · High · Medium · Low · Info.
Secrets found: rotate first, then remove from history.
```
