# Workflow spec template

```markdown
# Workflow: <name>
Owner: <person>    Platform: <n8n self-hosted | Power Automate | Rust service | ...>    Status: draft | live | paused

## Purpose
<one sentence>

## Trigger
<event / schedule / webhook>, expected volume: <n per day>, peak: <n per minute>

## Steps
1. Validate input (required: ..., signature check: yes)
2. Lookup/transform ...
3. IF <condition> → step 4 ELSE → step 6
4. ⏸ Approval: <who>, via <channel>, timeout <24h> → default <skip>
5. Action: ... (idempotency key: <event id>)
6. Notify: ...

## Errors
| Failure | Handling |
|---|---|
| upstream timeout | retry 3× (backoff 1m/5m/15m) → failed list + alert |
| invalid data | no retry → review list + alert |
| auth expired | alert owner immediately |

## Notifications
success: <none | daily digest>   failure: <channel/person>   silence: alert if no run by <time>

## Access (names only)
<connection names and scopes>

## Data
<fields processed; personal data? retention; where logs live>

## Tests
- [ ] happy path   - [ ] bad data   - [ ] upstream down   - [ ] duplicate event   - [ ] approval timeout
```
