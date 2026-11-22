# Method and statistics

## Data quality checklist (before any conclusion)
Row counts vs expectation · date range and gaps · time zones · duplicates · missing values (random or systematic?) · units and currencies ·
outliers (errors or real?) · definition changes over time (e.g. "active user" redefined) · joins that multiply rows · survivorship (only current customers/stocks present?).

## Descriptive
Use medians and percentiles for skewed data (revenue, order values, returns); means can mislead. Show distributions, not just averages.
Compare like with like (same weekdays, seasons, campaign periods). Year-over-year for seasonal businesses.

## Comparing groups and changes
- State the hypothesis before looking.
- For conversion rates: two-proportion test or Bayesian A/B with credible intervals; compute required sample size in advance.
- Report effect size with a confidence interval, not just a p-value; p < 0.05 isn't "important", p > 0.05 isn't "no effect".
- Multiple comparisons inflate false positives — correct (e.g. Holm/Benjamini-Hochberg) or pre-register the main metric.
- Simpson's paradox: check segment-level results when mixing groups of different sizes.

## Causality
Correlation is not causation. Stronger designs: randomized experiments → natural experiments/difference-in-differences → regression with controls (watch confounders) → before/after (weakest).
Name plausible confounders explicitly.

## Forecasting
Start with simple baselines (last value, seasonal naive, moving average) and beat them before using complex models; use time-based train/test splits;
report prediction intervals; re-check forecasts against actuals.

## Charts
One message per chart · title states the takeaway · axes labelled with units · bar charts start at zero · consistent colours · avoid dual axes and 3D ·
annotate events (campaigns, price changes) · show uncertainty bands where relevant.

## Reproducibility
Keep the script/notebook, data snapshot (or query + date), library versions; seed randomness; write the method in 3–5 lines with the result.
