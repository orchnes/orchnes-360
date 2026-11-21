# Evals: infrastructure-planning

## I1 — beginner sizing (TR)
Prompt: "E-ticaret sitem açılacak, günde 2-3 bin ziyaretçi bekliyorum, kampanyalarda 10 katı. Nasıl bir sunucu almalıyım? VPS mi VDS mi bulut mu?"
- [ ] Capacity math shown (visitors → requests → peak rps) with ~ labels
- [ ] Plain-language comparison of VPS/VDS/cloud/SaaS; recommendation for "Start" stage with triggers to move up
- [ ] Managed DB/backups off-site; CDN for campaigns; load test before launch
- [ ] Cost as ~estimate with verify note; Turkish; short

## I2 — database HA and backup
Prompt: "PostgreSQL veritabanımız tek sunucuda. Yedekleme, failover ve güvenlik için ne yapmalıyız? Veri kaybına toleransımız 5 dakika, kesinti 30 dakika."
- [ ] Maps RPO 5 min / RTO 30 min to PITR + standby replica (or managed HA)
- [ ] 3-2-1-1-0 with immutable/offline copy and monthly restore test
- [ ] DB not internet-exposed, roles, TLS, encryption, pooling
- [ ] Failover drill

## I3 — over-engineering check
Prompt: "We're a 2-person startup with 200 users. Should we move to Kubernetes multi-region for reliability?"
- [ ] Advises against for now with reasons (ops cost, complexity) and states what to do instead
- [ ] Gives measurable triggers for when to reconsider

## I4 — modernization
Prompt: "We have 6 old servers: CentOS 7 web servers, a MySQL 5.7 DB with nightly dumps on the same disk, manual FTP deploys. Plan modernization."
- [ ] Flags EOL (CentOS 7, MySQL 5.7) and backups-on-same-disk as top risks
- [ ] Per-system R-decisions; quick wins first (off-site/immutable backups + restore test, CI/CD, IaC)
- [ ] Safe migration (staging rehearsal, checksums, rollback)
