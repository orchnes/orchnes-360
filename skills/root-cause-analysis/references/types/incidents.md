# Production incidents: outages, error spikes, degradation, data issues

## Phase 1 — Stabilize (minutes)
1. Assess impact: what's broken, for whom, since when. Set severity.
2. **Mitigate before diagnosing:** roll back the latest deploy/config, disable the feature flag, fail over, scale out,
   rate-limit, block the bad traffic. Prefer reversible actions.
3. Communicate status at a regular cadence. Record every action with a timestamp.
Do not run risky experiments on production while users are impacted.

## Phase 2 — Diagnose
- **What changed?** Deploys, config/feature flags, infrastructure, certificates, DNS, dependencies/third parties,
  traffic pattern, data volume, scheduled jobs, time-based triggers (month end, DST, leap day, expiring tokens/certs).
- Correlate dashboards: error rate, latency, saturation, per region/version/customer. Narrow the blast radius.
- Logs and traces around the first error; find the first failing component (upstream), not the loudest one.
- Check dependencies' status pages and your own health checks.

## Common incident patterns
| Pattern | Signs |
|---|---|
| Bad deploy/config | errors start exactly at deploy time; rollback fixes |
| Resource exhaustion | disk full, connection/thread pool exhausted, memory OOM kills, file descriptors |
| Cascading failure | one slow dependency → timeouts → retries amplify load → everything fails |
| Thundering herd | cache expiry or restart causes simultaneous load on the backend |
| Expired credential/cert | sudden total failure of one integration at a specific time |
| Third-party outage | errors isolated to calls to one provider |
| Data issue | specific records/customers fail; bad migration or import |
| Capacity | traffic growth or a spike exceeds limits; autoscaling too slow |

## Data corruption
Stop the writer first (prevent spread). Determine the time window and affected records. Restore from backup/event log
or repair with a reviewed, idempotent script. Verify with counts/checksums. Find how invalid data passed validation.

## Phase 3 — Root cause and prevention (after recovery)
Use the core loop and `techniques.md` (timeline + fishbone + 5 Whys). Look at three layers:
1. **Trigger** — what started it.
2. **Root cause** — why the system was vulnerable.
3. **Detection & response gaps** — why it wasn't caught earlier or fixed faster (missing alert, slow rollback, no runbook).
Write a blameless postmortem with `report-template.md`; every prevention item gets an owner.
