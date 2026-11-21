# Pricing and unit economics

## Formulas
```
net price            = gross price / (1 + VAT rate)                 (where prices include VAT)
contribution / order = net price − COGS − packaging − shipping paid by you − payment fees − marketplace commission − returns/breakage allowance
contribution margin  = contribution / net price
CAC                  = marketing spend in a period / new customers acquired in that period (per channel)
LTV (contribution)   = contribution per order × orders per customer over their lifetime
LTV / CAC            ≥ ~3 is a common healthy heuristic; payback = CAC / contribution per order (in orders)
break-even volume    = fixed costs per month / contribution per order
```

## Worked example (all inputs illustrative — replace with real, sourced numbers)
Handmade mug, gross price 450 TL incl. 20% VAT (verify the applicable rate) → net 375 TL.
COGS 120 · packaging 25 · free shipping 70 · payment fee 3.5% of gross ≈ 15.75 → **contribution ≈ 144 TL (~38% of net)**.
Fixed costs 15,000 TL/month → **break-even ≈ 104 mugs/month**.
CAC 100 TL, 2.5 orders per customer lifetime → LTV ≈ 361 TL → **LTV/CAC ≈ 3.6**, payback ≈ 0.7 orders.
Selling the same mug on a marketplace with ~20% commission (verify) removes ~90 TL → contribution ≈ 54 TL: the channel changes the business.

## Sensitivity (always show)
Recompute contribution and break-even with ±20% on price, COGS, shipping and CAC; flag which input kills the model fastest.

## Pricing approaches
- **Value-based:** what the outcome is worth to the customer; anchored by alternatives.
- **Competitor ladder:** position deliberately (entry, core, premium) — don't just undercut.
- **Cost-plus floor:** never price below contribution ≥ target margin.
- Test prices with real offers (A/B on landing pages, marketplace variants, pre-orders) rather than surveys.
- Bundles and sets raise average order value and spread shipping cost (important for heavy/fragile items).

## Cash flow reminder
Inventory, deposits, payment-provider payout delays and marketplace payout schedules can make a profitable business run out of cash — model months, not just unit margins.
