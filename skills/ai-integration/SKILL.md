---
name: ai-integration
description: Build AI into a product or business platform end to end — choose LLMs and small models (hosted or local), ground answers in the platform's own knowledge and data (RAG + tools) so the assistant knows the platform in detail and refuses off-scope questions, design one agent per job with a supervisor and approval gates, defend against prompt injection, analyze customers within privacy law, evaluate, monitor cost and quality, and keep it learning. Use when the user wants a chatbot/assistant/agent on their site or app, "AI that knows our platform", customer support AI, product recommendations, AI agents for operations, RAG, model selection, or AI cost/safety/compliance.
license: MIT
---

# AI Integration

An AI feature is done when it answers from the platform's truth, says "I don't know" otherwise, stays in scope,
can't be talked into harmful actions, respects user data, and has numbers proving it works.

## 1. Pick the jobs (not "add AI")
List candidate jobs with value and risk: support answers, order tracking, product finder/recommendations, content drafts,
internal search, data analysis, operations monitoring. Start with **one high-volume, low-risk job** with a measurable outcome
(e.g. resolve 40% of support questions without a human, CSAT ≥ current).

## 2. Choose models
`references/models.md`: smallest model that meets the quality bar, hosted vs local by privacy/cost/latency, a fallback model,
routing (small model first, escalate hard cases — see `agent-orchestra`), through a gateway so models are swappable.

## 3. Ground it in the platform
`references/rag.md`: ingest docs, policies, catalog, FAQs, help center; live data through **tools** (order status, stock, account) instead of copying it into prompts;
permission-aware retrieval; citations; sync on change. The assistant answers **only** from retrieved/tool data for factual questions.

## 4. Keep it in scope and safe
`references/guardrails.md`: scope policy (platform topics only, polite redirect otherwise), retrieval-confidence gate ("I don't know, here's how to reach a human"),
prompt-injection defences (retrieved text and user uploads are data), PII handling, output validation, human handoff, rate limits and abuse protection.

## 5. One agent per job, one supervisor
`references/agents.md`: each agent has a narrow role, explicit tools with least privilege, a contract, and approval gates for money, data changes, and messages sent on the business's behalf.
A supervisor routes, checks and logs decisions (with `agent-orchestra` and `memory`).

## 6. Understand customers — lawfully
`references/customer-analytics.md`: segmentation, recommendations, churn signals, conversation insights — with a legal basis, transparency, opt-out,
data minimization, no inference of sensitive traits, human review of significant automated decisions (GDPR/KVKK, EU AI Act where applicable).

## 7. Evaluate before and after launch
`references/evaluation.md`: golden question set (in-scope, out-of-scope, adversarial), metrics (groundedness, correctness, refusal accuracy, escalation rate, latency, cost/conversation),
regression tests in CI for prompts/models, red-teaming, online monitoring and feedback loops.

## 8. Ship and operate
Gradual rollout (internal → % of users), clear AI disclosure to users, a visible path to a human, logging with privacy, cost budgets and alerts,
weekly review of failures → fix knowledge gaps first, prompts second, model last. Fine-tune only when retrieval + prompting can't reach the bar and data is sufficient and lawful to use.

## Rules
- Prefer retrieval and tools over model memory for anything factual or current.
- No silent actions: every write/purchase/refund/message goes through the approval mode the business set.
- Disclose AI use to end users; never impersonate a human.
- Health, legal, financial answers on a platform: information from approved sources only, with escalation to qualified staff.
- Keep models swappable; never hard-code one vendor into business logic.
