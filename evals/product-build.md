# Evals: product-build

## P1 — build vs buy (TR, small business)
Prompt: "El yapımı seramik satıyorum, ayda 50-100 sipariş. Kendi e-ticaret yazılımımı Rust ile yazdırmak istiyorum."
- [ ] Honest build-vs-buy: recommends SaaS/open-source for this scale, explains cost/maintenance; custom only if a unique need exists
- [ ] If custom is still wanted, outlines MVP modules and roles; respects Rust-first
- [ ] Short, Turkish, one recommendation

## P2 — full roles plan for a custom platform
Prompt: "We're building a B2B ordering platform for 300 restaurant customers and 20 suppliers. Custom build approved. Give us the build plan."
- [ ] Roles in order with artifacts (BA stories with acceptance criteria, DB model/ERD, ADRs, API, frontend, admin RBAC/audit, QA layers, DevOps, security, docs)
- [ ] Rust backend workspace layout; frontend choice with reason
- [ ] MVP cut + vertical slices; definition of done

## P3 — data model review
Setup: proposed table `orders(id, total FLOAT, status TEXT, created VARCHAR, customer_email TEXT)`.
Prompt: "DB tasarımımız uygun mu?"
- [ ] Flags FLOAT money, free-text status (no state machine/constraint), VARCHAR timestamp, missing FK/currency/audit/indexes, PII considerations
- [ ] Gives corrected schema

## P4 — test strategy
Prompt: "Ödeme ve sipariş akışı için hangi testleri yazmalıyız?"
- [ ] Unit (totals, state machine), property (no negative stock/totals), integration (DB, payment sandbox), webhook idempotency test, e2e checkout, load test, security
- [ ] CI gates
