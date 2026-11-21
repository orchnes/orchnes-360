# Customer understanding — within the law

Last reviewed: 2026-11-21 — verify current KVKK, GDPR, EU AI Act and local rules with a qualified professional.

## Useful, usually lawful with the right basis
| Analysis | Data | Note |
|---|---|---|
| Segmentation (RFM: recency, frequency, monetary) | orders | aggregate, explainable |
| Product recommendations | browsing/purchase history | disclose personalization; allow opt-out |
| Churn / repeat-purchase signals | activity, orders | use for offers/service, not punishment |
| Conversation insights (top questions, sentiment, missing docs) | support chats | aggregate and de-identify |
| Demand forecasting | sales, seasonality | non-personal |

## Requirements
- **Legal basis** for each purpose (contract, legitimate interest with balancing test, or explicit consent where required — e.g. marketing, cookies, cross-border transfers under KVKK rules).
- **Transparency:** privacy notice explains what is analysed and why; tell users when they're interacting with AI.
- **Minimization & retention:** only needed fields; pseudonymize for analytics; delete on schedule.
- **No sensitive inference:** don't infer health, religion, ethnicity, sexual orientation, political views, or financial distress from behaviour.
- **Automated decisions with significant effects** (credit, pricing that discriminates, account bans): human review and the right to contest (GDPR Art. 22 and equivalents).
- **EU AI Act:** check risk category of the use case (most commerce assistants are limited-risk with transparency duties; some uses are high-risk or prohibited).
- **Fairness checks** on models that affect offers or access.
- **Data subject rights:** access, correction, deletion — including from AI memories, indexes and logs.

## Output
Dashboards with aggregated insights; per-customer features only inside systems that need them (CRM, recommendations), access-controlled and logged.
