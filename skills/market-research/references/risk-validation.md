# Risks, customer interviews, experiments, decision memo

## Risk register
| Risk | Category | Likelihood (1–5) | Impact (1–5) | Score | Early warning signal | Mitigation | Owner |
|---|---|---|---|---|---|---|---|
Categories: market (demand, seasonality) · competition (price war, copycats) · regulatory/legal (licences, product rules, IP) · operational (supply, breakage, capacity) ·
financial (cash flow, FX, payment holds) · technical (platform, security) · reputational (reviews, social backlash) · key-person dependency.
PESTLE (political, economic, social, technological, legal, environmental) helps find external risks for new countries.

## Assumptions → riskiest first
List assumptions behind the plan ("customers will pay 450 TL", "breakage < 2%", "CAC < 100 TL"); rank by (uncertainty × impact); test the top one first.

## Customer interviews (behaviour, not opinions)
- Ask about the **last time** they bought or solved this: what, where, how much, why that one, what was annoying.
- Avoid: "Would you buy…?", "Do you like my idea?", leading questions, pitching during the interview.
- Listen for: workarounds, money already spent, emotional words, repeated complaints.
- 5–15 interviews per segment usually reveal the main patterns; stop when you hear nothing new.

## Surveys
Good for quantifying patterns found in interviews; bad for discovering them. Neutral wording, one question per item, behaviour questions, avoid self-selection bias, report sample size.

## Cheap experiments
| Experiment | Tests | Success example |
|---|---|---|
| Landing page + small ad budget | demand and messaging | ≥ X% email sign-ups or pre-order clicks at target CAC |
| Pre-orders / deposits | willingness to pay | N paid pre-orders in 2 weeks |
| Marketplace test listing | demand in a channel | sales velocity, conversion, review sentiment |
| Concierge / manual MVP | value of the service | repeat use, referrals |
| Price A/B | price sensitivity | conversion × margin at each price |
Set the threshold and deadline **before** running the test.

## Decision memo template
```markdown
# Decision: <idea / market>
Recommendation: GO | ADJUST (how) | STOP — <one sentence>

Evidence
- Demand: <signals with sources/dates>
- Market (SOM range): <~ value, key inputs>
- Competition & gap: <one paragraph>
- Unit economics: contribution ~X (Y%), break-even ~N/month, LTV/CAC ~Z (sensitivity: …)

Top risks: 1. … 2. … 3. …
Next experiment: <what> — success if <threshold> by <date>, budget <~>
Unknowns: <what we couldn't verify>
```
