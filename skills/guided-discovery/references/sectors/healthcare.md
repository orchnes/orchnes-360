# Sector pack: Healthcare

Last reviewed: 2026-11-21 — verify all regulatory details against current official sources. Healthcare is highly regulated:
the agent prepares and explains; licensing, clinical, legal and regulatory decisions require qualified professionals and **user approval**.
Never give diagnosis or treatment advice to end users; direct emergencies to local emergency services.

## First: which kind of healthcare business?
| Type | Examples | Regulatory weight |
|---|---|---|
| Wellness / information | fitness, nutrition content, appointment-free wellness apps | lower — but health data is still sensitive |
| Practice / clinic operations | booking, patient records, billing for a clinic | high — patient data, professional licensing |
| Telehealth | remote consultations | high — licensing per jurisdiction, consent, record keeping |
| Medical software (SaMD) / device | software that diagnoses, monitors or guides treatment | highest — medical device regulation (e.g. EU MDR, FDA, national authorities) |
| Health marketplace / pharmacy | selling health products or medicines | high — product and pharmacy rules |

## The map
| # | Component | Plain explanation | Who |
|---|---|---|---|
| 1 | Classification | decide which type above — it decides every rule that follows | AI analyses → **professional confirms** |
| 2 | Market & need | who needs it, who pays (patient, insurer, employer, state) | AI researches |
| 3 | Licensing & entity | permits for the practice/company and for professionals | AI prepares → **user + lawyer** |
| 4 | Health-data compliance | special-category data rules: KVKK (Türkiye), GDPR Art. 9 (EU), HIPAA (US), local equivalents | AI drafts → **DPO/lawyer approves** |
| 5 | Clinical safety & quality | who is clinically responsible; risk management; quality system for SaMD | **professionals** |
| 6 | Brand & trust | name, identity, credentials displayed, accessibility | AI designs |
| 7 | Product | booking, records, telehealth, app — with consent flows and audit trails | AI builds |
| 8 | Integrations | health records standards (HL7 FHIR), labs, e-prescription, insurers, national health systems | AI integrates → **access approvals** |
| 9 | Payments & billing | patient payments, insurance claims | AI integrates → **user signs** |
| 10 | Infrastructure & security | encryption, access control, audit logs, backups, data residency | AI sets up |
| 11 | Communication | reminders, follow-ups — health-advertising rules apply | AI runs → **user approves** |
| 12 | AI features | triage helpers, summaries — high-risk; human in the loop, transparency | AI builds → **clinical approval** |

## Decisions that change the path
1. **What type** (table above)? — default: practice/clinic operations if unclear.
2. **Which country?** — decides licensing, data law, data residency, insurance.
3. **Will the software influence diagnosis or treatment?** **No (operations/wellness)** / Yes (medical device route).

## Non-negotiables
- Data minimization, encryption in transit and at rest, role-based access, audit logging, breach-notification plan.
- Data residency: some countries require health data stored domestically — check before choosing hosting.
- Consent: explicit, recorded, withdrawable.
- Business associate / data processing agreements with every vendor touching health data.
- No health data in analytics/ad pixels or to AI providers without a compliant agreement; prefer local/self-hosted models for sensitive processing.
- Accessibility (WCAG) for patient-facing products.
