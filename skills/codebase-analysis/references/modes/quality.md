# Mode: Code quality & technical debt

## Signals and how to measure
| Signal | Tool (if available) | Fallback |
|---|---|---|
| Complexity | lizard, radon, gocyclo, eslint complexity rule | longest functions / deepest nesting by reading hotspots |
| Duplication | jscpd, PMD CPD | rg for repeated distinctive lines |
| Dead code | knip/ts-prune, vulture, deadcode, compiler warnings | exported symbols with no references (`rg -w name`) |
| Lint / type errors | project's linter and type checker | — |
| Tests | test runner + coverage report | count test files vs source files; which modules have none |
| Dependencies | `npm outdated`, `pip list --outdated`, etc. | manifest vs latest major versions |
| Debt markers | — | `rg -n "TODO|FIXME|HACK|XXX" | wc -l` and the oldest via git blame |
| Hotspots | — | churn × size (see recon) |

Run the project's own lint/test/typecheck commands first; they define the team's standard.

## What to look for
God files/classes · functions > ~50 lines or nesting > 3 · duplicated business logic · layer violations ·
inconsistent error handling · missing tests on critical paths · flaky or skipped tests · commented-out code ·
outdated or abandoned dependencies · inconsistent patterns for the same problem · weak typing at boundaries.

## Prioritize
Debt matters where code **changes often** or **fails costly**. A messy file nobody touches is low priority.
Score: impact (H/M/L) × change frequency (H/M/L) → action order.

## Report template
```markdown
## Code quality
**Health:** <one-line verdict>   **Tests:** <runner, pass/fail, coverage if known>   **Lint/type:** <n errors>

### Hotspots
| File | Churn (6 mo) | Size/complexity | Issue |
|---|---|---|---|

### Findings
| # | Finding | Location | Impact | Effort | Recommendation |
|---|---|---|---|---|---|

### Debt summary
- TODO/FIXME: n (oldest: <date>, `file:line`)
- Outdated deps: n major versions behind
- Untested critical modules: ...
```
