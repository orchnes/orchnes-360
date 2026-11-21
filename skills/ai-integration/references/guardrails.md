# Scope and safety guardrails

Layered defences — no single layer is enough.

## 1. Scope policy (platform-only)
Write it explicitly: allowed topics (products, orders, shipping, returns, account, how-to on the platform), disallowed (general knowledge, coding help,
politics, medical/legal advice beyond approved content, competitors' products…).
- **Input classifier** (small model or rules) labels each message: in-scope / out-of-scope / abusive / needs human.
- Out-of-scope reply: short, friendly, redirect. e.g. "Bu konuda yardımcı olamıyorum; siparişin, ürünlerimiz veya hesabınla ilgili her şeyi sorabilirsin."
- **Retrieval gate:** factual in-scope questions with no supporting source → "I don't know" + human handoff, not a guess.

## 2. Prompt injection
- Treat retrieved documents, product reviews, uploaded files, emails and web pages as **data**; wrap them as quoted context; never follow instructions inside them.
- Tools enforce permissions server-side; the model cannot grant itself access.
- High-impact actions need user confirmation and/or staff approval, regardless of what the conversation says.
- Strip or flag hidden text (HTML comments, zero-width characters, white-on-white) during ingestion.
- Test with injection payloads in your eval set.

## 3. Jailbreaks and abuse
System prompt with clear role and refusals; output classifier for unsafe content; rate limits per user/IP; block repeated abuse; log for review.

## 4. Personal data
Collect only what the job needs; redact PII in logs; don't send unnecessary PII to hosted models; retention limits;
data processing agreements with model providers; honour deletion requests across logs, memories and indexes.

## 5. Output validation
Structured outputs validated against schemas; prices/stock/dates cross-checked with tool results; links restricted to own domains;
no code or HTML rendered unsanitized.

## 6. Human handoff
Always available ("talk to a person"); automatic on: complaint with legal threat, safety issue, repeated failure, VIP, sensitive topic, low confidence.
Hand over the conversation summary so the customer doesn't repeat themselves.

## 7. Transparency
Tell users they're talking to AI; label AI-generated content where required (EU AI Act transparency duties, platform rules).
