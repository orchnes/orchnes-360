# Grounding: retrieval (RAG) and tools

## Knowledge sources
| Source | Method |
|---|---|
| Help center, policies (returns, shipping, privacy), product docs | ingest → chunk → embed → index |
| Product catalog | structured index (attributes as metadata) + text descriptions; or search API as a tool |
| Live data: orders, stock, prices, account, appointments | **tools/APIs**, never stale copies in the index |
| Internal knowledge (for staff assistants) | permission-aware index (respect source ACLs) |

## Ingestion pipeline
1. Extract clean text (HTML/PDF/Docs), keep title, URL, section, last-updated, language, access level as metadata.
2. Chunk by structure (headings/sections), ~200–800 tokens with small overlap; keep tables intact.
3. Embed and index (pgvector, Qdrant, Weaviate, OpenSearch, Meilisearch hybrid…). Start with pgvector if you already run PostgreSQL.
4. **Sync on change** (webhook or scheduled diff); delete removed content; record index version.

## Retrieval
- Hybrid search (keyword BM25 + vectors) beats either alone for product names, SKUs, codes.
- Metadata filters: language, product category, **user's access level**, region.
- Rerank the top 20–50 to the best 3–8 (cross-encoder reranker).
- Confidence gate: if the best score is below threshold or sources disagree → don't guess; say so and offer a human.

## Answering
- System instruction: answer only from provided sources and tool results; cite them; if missing, say you don't know.
- Show citations/links to the user where useful.
- Numbers, prices, dates and policies come verbatim from sources/tools.

## Tools for live data
- Narrow, typed functions: `get_order_status(order_id)` scoped to the authenticated customer — never a free-form SQL tool for customers.
- Server-side authorization on every tool call (the model's claim of identity is not authentication).
- Read tools are automatic; write tools (cancel, refund, change address) require confirmation/approval per policy.
- Staff analytics tools: read-only DB role, allow-listed or parameterized queries, row limits, timeouts.

## "Learning the platform end to end"
Index everything users and staff would need (catalog, policies, help docs, onboarding, FAQs, release notes); add a feedback loop:
unanswered/low-confidence questions → weekly review → write the missing doc → re-index. The knowledge base improves, not the model's memory.
