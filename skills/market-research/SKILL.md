---
name: market-research
description: Evidence-based market research for a new product, business or expansion — demand signals, market sizing (bottom-up TAM/SAM/SOM), customer research that measures behaviour not opinions, competitor benchmarking (features, prices, positioning, review mining), pricing, unit economics (contribution margin, CAC, LTV, break-even), risk analysis and cheap validation experiments, ending in a clear go / adjust / stop recommendation. Use when the user asks "is there a market for", "who are my competitors", "how big is the market", "what price should I charge", "will this be profitable", "risk analysis", "business model", or before investing in a new idea.
license: MIT
---

# Market Research

The goal is a decision, not a report. Find the riskiest assumption, test it cheaply, and say what the evidence supports.
All external facts come through `research` (sources, dates, opened vs snippet). Estimates are labelled `~` with their inputs shown.

## 1. Frame (infer, ask ≤ 3)
What exactly is offered, to whom, where, at what rough price · what decision this research serves (start? which segment? which country? which price?) ·
budget and time for research.

## 2. Demand — is anyone already paying for this?
Signals in order of strength: people **paying** competitors (sales ranks, review counts and growth, revenue disclosures) → people **searching**
(search volume and trends) → people **talking** (communities, social). Sources and methods: `references/sizing-and-demand.md`.

## 3. Size — bottom-up first
SOM (what you can realistically win in 1–3 years) built from customers × purchase frequency × price, cross-checked with a top-down figure.
Show every input and its source; give a range, not a single number.

## 4. Customers
Talk to 5–15 target customers about **past behaviour** (last time they bought/solved this, what they paid, what annoyed them) — not "would you buy?".
Segment by need and willingness to pay. Interview guide and survey pitfalls: `references/risk-validation.md`.

## 5. Competitors
Direct, indirect and substitutes; benchmark matrix (offer, price, channels, positioning, strengths, weaknesses, review themes); find the gap you can own.
Method and templates: `references/competitors.md`.

## 6. Pricing and unit economics
Price from value and competitor ladder, then check the numbers: contribution margin per order, CAC by channel, LTV, payback, break-even volume, sensitivity.
Formulas and a worked example: `references/unit-economics.md`. If unit economics don't work at realistic assumptions, say so plainly.

## 7. Risks and validation
Risk register (market, competition, regulatory, operational, financial, technical, reputational) with likelihood × impact and mitigations;
list assumptions, test the riskiest with the cheapest experiment (landing page, pre-orders, marketplace test listing, concierge MVP). `references/risk-validation.md`.

## 8. Recommendation
Decision memo (template in `references/risk-validation.md`): **Go / Adjust / Stop**, the evidence for it, key numbers (~ with ranges), top 3 risks,
next experiment with success threshold and deadline. Feed results into `guided-discovery` and `planner`.

## Rules
- Behaviour beats opinion; paying beats searching beats talking.
- No invented statistics — every number has a source or is an explicit assumption.
- Show ranges and sensitivity; one-number forecasts are false precision.
- Collect competitor data ethically: public information, respect terms of service and robots rules, no deception, no fake accounts.
- Say when the data says "no".
