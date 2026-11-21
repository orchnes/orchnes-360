# Hosting options

Last reviewed: 2026-11-21 — prices, plan names and regional availability change; verify with providers. Terms like "VDS" vary by provider: check what is actually guaranteed (dedicated vCPU? RAM? disk IOPS?).

| Option | What it is (plain) | Good for | Watch |
|---|---|---|---|
| SaaS (hosted store builders, hosted CMS, Google Workspace…) | you rent the finished product | non-technical teams, fast start | lock-in, per-transaction or per-seat fees, limited customization |
| Shared hosting | a room in a shared apartment | simple sites, very low budget | noisy neighbours, limited control and security isolation |
| VPS | your own flat in a building (shared physical server, virtualized) | small apps, full control at low cost | you patch, secure and back it up; CPU may be shared/oversubscribed |
| VDS (virtual dedicated server) | a flat with guaranteed resources | steadier performance than VPS | definitions differ by provider — read the specs |
| Dedicated / bare metal | your own house | steady high load, special hardware, cost efficiency at scale | hardware failure is yours to plan for; slower to scale |
| PaaS (app platforms, managed containers) | a serviced apartment: you bring the app, they run the servers | small teams wanting less ops | cost at scale, platform limits |
| Managed Kubernetes | a managed building complex for many services | many services, large teams, portability | operating complexity; overkill for one app |
| Serverless functions | pay per use, no server to manage | spiky or low traffic, event processing | cold starts, execution limits, cost at constant high load |
| Hybrid / on-premises | your own server room plus cloud | data residency, existing hardware, low-latency local needs | staff, power, cooling, physical security |

## Selection rules
1. Small team, no ops staff → SaaS/PaaS + managed database.
2. Budget-limited and technically capable → VPS/VDS + managed or well-backed-up DB, IaC from day one.
3. Steady high load and stable architecture → dedicated/bare metal or committed cloud pricing.
4. Regulated data → providers and regions that meet residency rules; signed data processing agreements; verify certifications (ISO 27001, SOC 2).
5. Users mostly in one country → host near them; CDN for global static content.

## Provider checklist
Region/data centre location · SLA and credits · backup and snapshot options · DDoS protection · private networking · IPv6 ·
support quality and language · egress pricing · exit path (data export, no proprietary lock-in where avoidable).
