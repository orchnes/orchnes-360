---
name: analysis
description: Rigorous, reproducible data analysis with honest uncertainty — business analytics (sales, funnels, cohorts, retention, forecasting), financial markets (stocks, funds, macro), crypto assets, and personal or population health data — using code on real data, sound statistics, clear charts, sourced context and explicit risk warnings; never personalized investment advice, guaranteed returns, diagnosis or treatment. Use when the user asks to analyze data, a spreadsheet or dashboard, sales or KPI trends, a stock/fund/crypto, a backtest, lab results or wearable data, or "what does this data say".
license: MIT
---

# Analysis

Numbers you can reproduce, conclusions the data supports, uncertainty stated, risks flagged. When the data can't answer the question, say so.

## 1. Frame
The decision or question · the data available (source, period, granularity, owner) · what would change the answer.
Pick the domain guide:

| Domain | Guide |
|---|---|
| Business: sales, funnels, cohorts, retention, pricing tests, forecasting | `references/business.md` |
| Financial markets: stocks, ETFs/funds, bonds, macro, backtests | `references/markets.md` |
| Crypto assets: tokens, on-chain data, DeFi, exchanges | `references/crypto.md` |
| Health: personal lab/wearable data, health literature, population data | `references/health.md` |
Method and statistics for every domain: `references/method.md`.

## 2. Work on real data with code
- Load the actual data (files, databases, official APIs); inspect shape, types, ranges, missing values, duplicates, outliers **before** analysing.
- Do the analysis in code (Python/pandas/polars, SQL, R, or Rust) — not mental arithmetic — and keep the script so results can be re-run.
- Document every transformation and assumption.

## 3. Analyse honestly
- Descriptive first (what happened), then diagnostic (why — with evidence), then predictive (ranges, not points).
- Report uncertainty: confidence intervals, ranges, sample sizes; distinguish correlation from causation.
- Check robustness: different periods, segments, outlier handling. If a result disappears with a small change, it isn't a result.

## 4. Present
Answer first (2–4 sentences) → key numbers with units, period and source → 1–3 charts that each make one point (labelled axes, honest scales) →
caveats and data limits → next step. Use the environment's charting skill/tools if available.

## 5. Domain safety
- **Markets & crypto:** analysis and education, not personalized advice. No "buy/sell X", no price targets presented as predictions, no guaranteed returns.
  Explain risks (volatility, drawdowns, liquidity, leverage, fraud). Point to licensed advisers for personal decisions. Time-stamp all prices.
- **Health:** information and pattern description, not diagnosis or treatment. Use the lab's own reference ranges; recommend discussing results with a clinician;
  **urgent symptoms → emergency services immediately**. Health data is special-category personal data — process minimally and privately.
- Never present backtests, past returns or models as promises.

## Rules
- No number without a source or a computation you can show.
- Say "the data doesn't show that" as readily as "it does".
- Don't torture data: pre-state the question; report what you tested, including null results.
- Keep sensitive data (customer, financial, health) local and out of third-party tools unless the user approves.
