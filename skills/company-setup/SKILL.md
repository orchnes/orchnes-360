---
name: company-setup
description: Prepare a company setup that fits the growth plan — entity type (sole proprietor, partnership, limited/LLC, joint-stock/corporation, branch/subsidiary), country-specific registration steps, tax and social-security registration, bank account, licences, accounting and e-invoicing, and the legal compliance the business must meet by region (privacy laws such as KVKK/GDPR/CCPA/LGPD, consumer and e-commerce law, employment, accessibility, sector licences) — with every filing, signature, payment and legal decision marked for human and professional approval. Use when the user asks how to start/register a company, which company type to choose, what legal obligations apply, KVKK/GDPR compliance, ETBİS/VERBİS, permits, or how to restructure for growth or investors.
license: MIT
---

# Company Setup

The agent **prepares, explains and tracks**; the founder **decides, signs and files**, with an accountant/lawyer confirming.
Company law, tax and thresholds change and differ by country — verify current rules with `research` (official sources, dated) before stating them.

## 1. Frame (infer, ask ≤ 3)
Country (and city) of operation · founders: number, residency/nationality · what the business does (sector licences?) ·
**growth plan** (side business → solo full-time → partners → employees → investors → international) · expected revenue in year 1 · selling online/abroad?

## 2. Choose the structure
Use `references/growth-plan.md` to map the plan to a structure and `references/entity-types.md` for country specifics.
Present 2 options with: liability, tax treatment, setup and running cost (~, dated), admin burden, investor-readiness, conversion path later. Recommend one.

## 3. Setup checklist (adapt per country)
1. Name availability check (registry + trademark search → `brand-ip`) and domain/handles.
2. Founding documents (articles/statutes, shareholder agreement for multiple founders: vesting, decision rights, exit, IP assignment).
3. Capital and registration with the trade/company registry; notary where required.
4. Tax registration (income/corporate tax, VAT), e-invoicing set-up where mandatory.
5. Social security / employer registration (founder and employees).
6. Business bank account (KYC — user action) and payment providers (`commerce-integrations`).
7. Licences and permits for the sector and location.
8. Accounting: accountant engaged, bookkeeping system, invoice numbering, expense policy.
9. Compliance set-up: `references/compliance.md` (privacy, consumer/e-commerce, cookies, employment, accessibility, sector rules).
10. Insurance (liability, product, cyber where relevant).
11. Compliance calendar: tax filings, annual accounts, registry renewals, data-protection reviews — automated reminders (`workflow-automation`).

## 4. Human approval
Everything in `references/human-approval.md` — filings, signatures, payments, bank/KYC, contracts, legal positions — is prepared by the agent and done or approved by the founder,
with a professional where marked. The agent never submits official filings or signs on someone's behalf.

## 5. Deliver
One-page recommendation (structure + why), country checklist with owners, document drafts marked **DRAFT — review by a qualified professional**,
cost and timeline (~, dated), compliance calendar, open questions for the accountant/lawyer. Save decisions to memory (`.memory/decisions.md`).

## Rules
- Never present legal or tax claims as current without a dated official source; label everything else `(verify)`.
- Drafts (statutes, privacy notices, terms, contracts) are starting points, not legal advice.
- Prefer the simplest structure that fits the next 12–24 months, with a known conversion path.
- Personal data of founders (ID numbers, addresses) is handled minimally and never put in shared files without need.
