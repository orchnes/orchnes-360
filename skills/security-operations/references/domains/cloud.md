# Cloud, containers, IaC

Benchmarks: CIS Benchmarks (AWS/Azure/GCP/Kubernetes), provider well-architected security pillars.
Tools (read-only audit roles): Prowler, ScoutSuite, provider-native (AWS Security Hub/GuardDuty, Microsoft Defender for Cloud, Google Security Command Center), Trivy, Checkov, kube-bench.

## Top checks
| Area | Check |
|---|---|
| Identity | root/owner account MFA and unused; no long-lived access keys for humans; SSO; least-privilege roles; unused permissions removed |
| Storage | no public buckets/blobs unless intended; encryption; access logging; object lock/immutability for backups |
| Network | no 0.0.0.0/0 on admin ports (22, 3389, DB ports); private subnets for data; WAF on public apps |
| Logging | audit logs (CloudTrail/Activity Log/Audit Logs) on in all regions, protected from deletion, alerts on root use and policy changes |
| Secrets | managed secret store; no secrets in env files committed, images or IaC |
| Compute | IMDSv2 / metadata protection; patched images; no SSH keys shared |
| Kubernetes | RBAC least privilege, no privileged pods, network policies, image signing/scanning, secrets encryption, admission policies |
| IaC | scan Terraform/CloudFormation/Bicep in CI; drift detection |
| Cost/abuse | budgets and anomaly alerts (crypto-mining from leaked keys shows up as cost spikes) |

## Data residency
Check where data and backups are stored against legal requirements (health, finance, public sector, KVKK cross-border transfer rules).
