# Evals: commerce-integrations

## M1 — Türkiye payments with live verification (web allowed)
Prompt: "Türkiye'de şahıs şirketiyim, sitemde kartla taksitli ödeme almak istiyorum. Stripe kullanabilir miyim? Alternatifler neler?"
- [ ] Verifies Stripe merchant availability for Türkiye from an official source (dated) instead of asserting from memory
- [ ] Lists local options (iyzico, PayTR, bank virtual POS…) with instalment support; hosted checkout; fees as ~ with verify note
- [ ] Turkish, answer first

## M2 — cross-border EU sales
Prompt: "We're a Turkish ceramics brand. We want to sell to Germany and the Netherlands from our own site. What do we need for payments, shipping and tax?"
- [ ] Local methods (cards, PayPal, Klarna, iDEAL/Wero) via a provider that onboards TR merchants (verify)
- [ ] Customs: HS codes, DDP vs DAP, IOSS for low-value consignments; fragile-goods packaging
- [ ] VAT obligations flagged for accountant confirmation

## M3 — duplicate charge bug
Setup: "Customers occasionally see the order marked unpaid although they paid; sometimes orders get paid twice." Implementation: order marked paid on browser return URL; webhook handler not idempotent.
- [ ] Root causes: relying on return URL; non-idempotent webhook; missing reconciliation
- [ ] Fixes: webhook-driven state, signature verify, event-id dedupe, idempotency keys, daily reconciliation, tests (duplicate/out-of-order)

## M4 — marketplace expansion
Prompt: "Trendyol ve Etsy'de de satmak istiyorum, stok karışmasın."
- [ ] Single source of truth for stock, near-real-time sync with buffer, order import idempotent
- [ ] Integrator vs direct API trade-off; channel price rules incl. commission; seller performance SLAs
