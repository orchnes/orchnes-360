# Model selection

Last reviewed: 2026-11-21 — models, prices and licences change monthly; check current leaderboards, provider pages and your own eval results.

## Large vs small
| | LLM (large, hosted frontier or large open-weights) | SLM (small, ~1–15B params, often local) |
|---|---|---|
| Strong at | complex reasoning, long context, multilingual nuance, agentic tool use | classification, routing, extraction, short grounded answers, summarization |
| Cost / latency | higher | very low; runs on modest GPUs/CPUs |
| Privacy | data leaves your infra unless self-hosted | can stay on-premises |
Pattern: **SLM for routing/classification/guardrails + LLM for hard generation**, or SLM-first with escalation on low confidence.

## Hosted vs local
- Hosted APIs: fastest to start, best quality at the top end; check data-processing terms (no training on your data, retention, region).
- Local/self-hosted open-weights: runtimes such as Ollama, llama.cpp, vLLM, TGI; required for strict data residency or offline; check model licence for commercial use.
- Embeddings: hosted or local embedding models; keep the same model for indexing and querying; re-index when changing.

## Selection procedure
1. Build a 50–200 item eval set from real questions (see evaluation.md).
2. Test 3–5 candidate models (mix of tiers and at least one local option) with the same prompts and retrieval.
3. Score quality, latency (p95), cost per conversation, language quality (e.g. Turkish), tool-call reliability.
4. Pick the cheapest model that passes; set a fallback model from a different provider.

## Gateway and routing
Use a gateway layer (e.g. LiteLLM, OpenRouter, or your own thin abstraction) for: provider switching, fallbacks, retries, rate limits, caching,
per-feature budgets, logging. Route by task difficulty and confidence (see `agent-orchestra` routing matrix).

## Cost control
Prompt caching for stable system prompts and context · response caching for repeated questions · short contexts (retrieve less, better) ·
streaming for perceived latency · max tokens per response · budgets and alerts per feature and per customer.
