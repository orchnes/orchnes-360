# Application security

For whole-repo reviews also use the `codebase-analysis` skill's security mode. Reference: OWASP Top 10, OWASP ASVS, CWE Top 25.

## Automated (in CI on every PR)
| Check | Tools (examples) |
|---|---|
| SAST | Semgrep, CodeQL, language linters (Bandit, gosec, clippy lints, Brakeman, ESLint security plugins) |
| Secrets | gitleaks, trufflehog (pre-commit + CI + history scan) |
| Dependencies (SCA) | osv-scanner, cargo audit/cargo deny, npm audit, pip-audit, govulncheck, Dependabot/Renovate |
| DAST (staging only, authorized) | OWASP ZAP baseline scan |
| Containers/IaC | Trivy, Checkov |

## Injection detection — manual review (source → sink)
| Injection | Vulnerable pattern | Fix |
|---|---|---|
| SQL | string concatenation/format into queries (`"... WHERE id=" + id`, f-strings, template literals) | parameterized queries / prepared statements; ORM query builders; least-privilege DB user |
| NoSQL | user objects passed into query filters (`{$ne: null}`) | schema validation, cast types, disallow operators from input |
| OS command | `exec`/`system`/`shell=True` with input | avoid shell; pass argument arrays; allow-lists |
| Code | `eval`, dynamic imports, template injection | never evaluate input; sandboxed templates with autoescape |
| LDAP/XPath | concatenated filters | proper escaping libraries |
| XSS | raw HTML rendering (`innerHTML`, `dangerouslySetInnerHTML`, `|safe`) | contextual auto-escaping, sanitizer for rich text, CSP |
| Path traversal | user input in file paths | canonicalize + allow-list base directory |
| SSRF | user-controlled URLs fetched server-side | allow-list hosts, block internal ranges and metadata endpoints |
| Header/log injection | CR/LF in input | strip/encode control characters |
| LLM prompt injection | untrusted text concatenated into prompts that can trigger tools | separate data from instructions, least-privilege tools, human approval for actions, output validation |

Search hints: `rg -n "execute\(.*(\+|%|format|f\")"`, `rg -n "shell=True|os\.system|child_process\.exec|eval\("`, `rg -n "innerHTML|dangerouslySetInnerHTML"`.
Confirm each hit by tracing whether the value can be user-controlled.

## Other high-value checks
AuthZ on every endpoint (IDOR) · authentication and session handling · CSRF for cookie auth · rate limits on auth and costly endpoints ·
secure headers (CSP, HSTS, X-Content-Type-Options, frame-ancestors) · CORS · file upload validation · deserialization · error messages without internals ·
dependency pinning and lockfiles · secrets out of code and images.
