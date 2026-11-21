# Security report template

```markdown
# Security assessment: <scope>
Date: <date>   Authorized by: <name/role>   Assessor: <agent/model + human>   Mode: read-only | active (scope ref)

## Executive summary (plain language, 5 bullets max)
- Overall risk: <High/Medium/Low> — <one sentence why>
- Most urgent: ...

## Scope
Tested: <assets, domains, repos, accounts>      Not tested: <explicitly>      Tools: <list with versions>

## Findings
| # | Severity | Title | Asset | Evidence | Risk | Fix | Effort | Status |
|---|---|---|---|---|---|---|---|---|
| 1 | Critical | SQL injection in search | api /search?q | `orders.py:88` f-string query; payload test in staging | DB read | parameterized query | S | open |

Severity: Critical · High · Medium · Low · Info (CVSS + exploitability + exposure + asset value).

## Baseline gaps
| Control | Status |
|---|---|
| MFA everywhere | partial (2 admins without) |

## Next steps (prioritized)
1. ...

## Appendix
Raw tool outputs (secrets redacted), methodology.
```
