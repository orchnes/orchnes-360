# RCA report template

Keep blameless: describe systems and decisions, not people.

```markdown
# RCA: <short title>
Type: bug | performance | incident     Severity: <S1–S4>     Status: fixed | mitigated | open

## Symptom
<expected vs actual, one or two sentences; scope/impact: who, how many, how long>

## Root cause
<the mechanism in plain words — why it happened and why it was possible>

## Evidence
- <reproduction steps / failing test name>
- <log line, trace, metric, profile, bisect result>

## Timeline (incidents only)
| Time (UTC) | Event |
|---|---|

## Fix
<what changed, link to commit/PR; test that proves it>

## Prevention
| Action | Type (test / guard / alert / process) | Owner | Done |
|---|---|---|---|

## What went well / what to improve (optional)
```
