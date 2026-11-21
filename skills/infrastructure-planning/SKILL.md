---
name: infrastructure-planning
description: Plan and set up infrastructure sized to the business — capacity estimates (users → requests → servers, storage, bandwidth), hosting choice (shared, VPS, VDS, dedicated, PaaS, containers/Kubernetes, serverless, SaaS), database design and administration (security, backup, PITR, tiers, replication, failover), resilience targets (RPO/RTO, availability), local + cloud tiering, automation (IaC, CI/CD), observability, cost, and modernization of existing systems. Gives staged plans (start → grow → scale) with measurable triggers for moving up. Use when the user asks how many users a setup can handle, which server/hosting to choose, VPS vs VDS vs cloud, database setup, backups, failover, scaling, high availability, disaster recovery, cloud costs, or migrating/modernizing infrastructure.
license: MIT
---

# Infrastructure Planning

Right-size for today, design the path for tomorrow, and write down the numbers that trigger the next step.
Over-engineering wastes money; under-planning loses data. Both are failures.

## 1. Requirements (infer, ask ≤ 3)
Users (now, 12 months) and usage pattern · traffic peaks (campaigns, seasonality) · data volume and growth · latency expectations and user geography ·
availability need (what does 1 hour down cost?) · data loss tolerance · compliance/data residency (KVKK, GDPR, health, finance) ·
budget · team skills (who operates it at 3 a.m.?).

## 2. Estimate capacity
Use `references/capacity.md`: users → requests/second at peak → concurrency → CPU/RAM → DB load → storage and bandwidth growth.
Label estimates `~`; validate with a load test before launch and with real metrics after.

## 3. Choose the stage and hosting
`references/hosting.md` compares options. Default progression:

| Stage | Typical shape | Move up when (example triggers) |
|---|---|---|
| **Start** | managed SaaS/PaaS, or one VPS + managed DB, CDN, daily off-site backups | CPU > 70% at peak for weeks · p95 latency over target · DB > 70% of resources · downtime cost > cost of redundancy |
| **Grow** | separate app and DB tiers, 2+ app instances behind a load balancer, managed DB with standby/replica, cache, queue for background jobs, staging environment | single-zone outage unacceptable · traffic spikes > 5× baseline · team > ~5 engineers deploying daily |
| **Scale** | multi-zone (then multi-region if required), autoscaling, read replicas/sharding, containers/orchestration, SRE practices | — |
Prefer managed services when the team is small; prefer simplicity over fashionable complexity (Kubernetes only when its benefits outweigh its operating cost).

## 4. Data layer
`references/database.md`: engine choice, administration, security, backup (3-2-1-1-0), PITR, storage tiers, replication and failover, pooling, migrations.
**Backups are only real after a successful restore test.**

## 5. Resilience
`references/resilience.md`: set RPO/RTO and availability targets with the user in money terms, pick the redundancy level that meets them,
write the DR runbook, and schedule failover and restore drills.

## 6. Security baseline
Private networking for data, least-privilege access, secrets in a vault, TLS everywhere, patching, firewall default-deny, audit logs.
Hand detailed hardening to `security-operations`.

## 7. Automate and observe
- Infrastructure as code (OpenTofu/Terraform, Pulumi, Ansible), CI/CD with staged deploys and rollback, configuration in version control.
- Observability: metrics, logs, traces; alerts on user-facing symptoms (error rate, latency, saturation) and on backup/cert failures; status page for customers when relevant.

## 8. Cost
Estimate monthly cost per stage (compute, DB, storage, egress, backups, monitoring, support) with `~` and a date; verify against provider calculators.
Add budgets and anomaly alerts. Reserved/committed pricing only for stable baseline load.

## 9. Deliver
Architecture diagram (see `diagrams-mapping` if installed), stage plan with triggers, capacity and cost tables, backup/DR plan, runbooks, IaC repo.
Validation evidence: load test results, restore test, failover drill. For existing systems, use `references/modernization.md`.

## Rules
- Numbers over adjectives: "handles ~150 rps at p95 < 200 ms (load-tested 2026-11-21)", not "scalable".
- Every single point of failure is either removed or explicitly accepted by the user with its cost.
- Data residency and backups location checked against legal requirements.
- Changes to production infrastructure need approval and a rollback plan.
