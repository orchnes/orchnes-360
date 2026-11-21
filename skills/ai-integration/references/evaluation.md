# Evaluation and monitoring

## Golden set (before launch, versioned)
- 60% real in-scope questions with expected answer + source.
- 20% out-of-scope questions (expected: polite redirect).
- 10% unanswerable in-scope questions (expected: "I don't know" + handoff).
- 10% adversarial: prompt injection in docs/messages, jailbreaks, requests for other customers' data, attempts to trigger refunds.
Include every language the platform supports.

## Metrics
| Metric | Target example |
|---|---|
| Correct & grounded answers | ≥ 90% on in-scope |
| Refusal accuracy (out-of-scope correctly redirected) | ≥ 95% |
| Unsupported-claim rate (hallucination) | ≤ 2% |
| Injection resistance | 100% of adversarial cases blocked from actions |
| Escalation rate / resolution rate | tracked vs baseline |
| p95 latency, cost per conversation | within budget |
Scoring: exact checks where possible; LLM-as-judge with a rubric for the rest, spot-checked by humans.

## In CI
Run the golden set on every prompt, retrieval or model change; block deploys on regressions.

## Online
User feedback (thumbs + reason), human-review sample (e.g. 2% of conversations weekly), unanswered-question log, escalation reasons,
cost and latency dashboards, drift alerts when metrics move. Weekly loop: fix knowledge gaps → prompts → routing → model.
