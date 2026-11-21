---
name: commerce-integrations
description: Choose and integrate payments, marketplaces, shipping, invoicing and tax for any country or continent — which payment providers accept a business registered where the user is, which local methods buyers expect (cards with instalments, wallets, bank transfer, cash on delivery, BNPL), PCI/SCA rules, webhooks, refunds, chargebacks and reconciliation; marketplace channel sync (catalog, stock, price, orders, returns); carriers, labels, tracking, customs; e-invoicing and sales tax/VAT. Use when the user asks which payment provider to use, whether a provider works in a country, how to sell on Amazon/Trendyol/Etsy/other marketplaces, shipping integration, cross-border selling, e-invoice/e-Fatura, VAT/OSS/sales tax, or payment integration bugs.
license: MIT
---

# Commerce Integrations

Availability, fees and rules change constantly. This skill tells you **what to check and how to integrate**;
country facts are verified with `research` against official provider pages before they're stated as current.

## 1. Frame (infer, ask ≤ 3)
Where the business is **registered** (decides which providers will onboard it) · where **buyers** are (decides methods, languages, tax, shipping) ·
what is sold (physical/digital/services/regulated) · volume and average order value · existing platform (SaaS store, open source, custom).

## 2. Payments
1. Shortlist providers from `references/payments-by-region.md` for the business country and buyer markets.
2. **Verify** for each: merchant onboarding in the business's country, supported buyer methods and currencies, payout currency/timing, fees, reserve/rolling-hold policy,
   prohibited-business list, platform plugin availability. Cite sources with dates.
3. Prefer hosted checkout/fields (minimal PCI scope) and a provider with local methods buyers trust (e.g. instalments in Türkiye, PIX in Brazil, UPI in India, iDEAL/Wero in NL).
4. Selling digital products/SaaS globally → consider a merchant-of-record to offload global tax.
5. Integrate with `references/payment-engineering.md` (webhooks, idempotency, refunds, disputes, reconciliation, testing).

## 3. Marketplaces
Pick channels where the target buyers already shop; compare commission, fees, logistics programmes, rules and approval process.
Sync catalog, stock, price, orders, tracking and returns as in `references/marketplaces.md`; decide direct API vs channel-management integrator.

## 4. Shipping, invoicing, tax
Carriers, rate shopping, labels, tracking, returns, cross-border customs and duties; e-invoicing mandates and VAT/sales-tax engines:
`references/shipping-invoicing.md`. Legal/tax setup decisions go to the user with an accountant (`company-setup`).

## 5. Deliver
Recommendation table (provider/channel · why · fees (~, dated) · availability verified with link) → integration plan → sandbox test evidence → go-live checklist.
Credentials only via the provider dashboards/secret stores — never in chat. Going live, signing contracts and KYC are the user's actions.

## Rules
- Never state "X works in country Y" without a dated source.
- Card data never touches the merchant's servers unless the business is deliberately taking on full PCI DSS scope.
- Every money-moving webhook is verified (signature) and idempotent; every refund is authorized per policy.
- Reconcile daily: orders ↔ payments ↔ payouts ↔ accounting. Unmatched items are alerts, not surprises at month end.
