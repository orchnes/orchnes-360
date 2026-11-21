# Capacity estimation

All results are `~` estimates until load-tested.

## From users to requests
```
daily requests      = DAU × requests per user per day
average rps         = daily requests / 86 400
peak rps            = average rps × peak factor          (typical 5–10×; campaigns/sales 20×+)
concurrent requests = peak rps × average response time (s)   (Little's law)
```
Example: 10 000 DAU × 20 requests = 200 000/day → ~2.3 rps average → ~23 rps at 10× peak → at 0.2 s per request ≈ 5 concurrent requests.
Most small and medium businesses need far less infrastructure than they fear; spikes and the database are usually the real limits.

## Rough server sizing (validate with a load test)
| Workload | Rule of thumb (~) |
|---|---|
| Efficient API (Rust/Go/Java/.NET), cached, simple DB queries | hundreds to thousands rps per vCPU |
| Typical interpreted-language web app (PHP/Python/Ruby/Node) with DB access | tens to low hundreds rps per vCPU |
| Server-side rendered pages with heavy queries | can drop to single-digit rps per vCPU without caching |
| RAM | runtime baseline + per-worker memory × workers + cache; keep 30% headroom |
Caching (CDN for static assets, page/fragment cache, Redis for hot data) often multiplies capacity more than bigger servers.

## Database
- Queries per request × peak rps = peak QPS; check slow queries and indexes before scaling hardware.
- Working set (hot data + indexes) should fit in RAM for good performance.
- Connections: app instances × pool size ≤ DB max connections (use a pooler such as PgBouncer).

## Storage and bandwidth
```
storage growth/month = new records × average size + media uploads + logs + backups (× retention copies)
egress/month         = page views × average page weight (after CDN) + API payloads + downloads
```
Plan 12 months ahead with 30–50% headroom; alert at 70–80% disk use.

## Validate
Load test the critical journeys (k6, Locust, Gatling, JMeter) at 1×, 2×, 5× expected peak in a staging environment that mirrors production;
record p50/p95/p99 latency, error rate and resource use; find the first bottleneck. Re-test after major changes.
