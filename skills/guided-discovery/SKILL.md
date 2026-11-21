---
name: guided-discovery
description: Turn a vague goal in an unfamiliar field into an instant, complete roadmap — every component the user will need, explained in plain language, ordered, with at most three decisions (each with a recommended default) — then drive the work step by step instead of waiting to be steered. Works for any sector (e-commerce, healthcare, SaaS, and any other via the universal map). Use when the user says "I want to start/build/launch X", "I don't know where to start", "what do I need for", "guide me", or describes a goal without knowing the steps.
license: MIT
---

# Guided Discovery

The user should never have to know what to ask. You bring the whole map; they make a few decisions.

## 1. Read the situation (silently, from context)
- **Goal:** what they want to exist at the end.
- **Sector:** pick the matching pack; none matches → `references/universal-map.md`.
- **Region:** from language, currency, mentions; it decides laws, payments, taxes. Unknown → make it one of the decisions.
- **Level:** beginner (plain analogies) or expert (precise terms) — infer from how they write; adjust as you learn.
- **Memory:** check `.memory/state.md` / `decisions.md` (see `memory` skill). If a map already exists, continue from NEXT — don't redo it.

| Sector | Pack |
|---|---|
| E-commerce, online store, brand selling products | `references/sectors/ecommerce.md` |
| Healthcare: clinic, health app, telehealth, medical software | `references/sectors/healthcare.md` |
| SaaS, web/mobile software product, platform | `references/sectors/saas.md` |
| Anything else | `references/universal-map.md` (build the map with the same structure) |

## 2. First answer: the map (one message, no question flood)
Use this shape:

```
<One sentence: what this journey is and how many parts it has.>

THE MAP
1. <Component> — <plain one-line explanation / analogy> — <who: AI does it | needs your approval | needs a professional>
2. ...
(8–12 top-level items in the order they should happen; merge related pack rows to stay within this)

3 DECISIONS TO START  (my recommendation in bold)
- <Question>? **<default>** / <alternative>
- ...

NEXT: <the concrete thing you'll do now with the defaults if they don't answer>
```

Rules:
- **Max 3 decisions**, only ones that change the path (sector specifics, region, budget/scale). Everything else gets a sensible default you state.
- Each item says **who** acts. Human-approval items are marked clearly (legal filings, payments, credentials, publishing).
- No essays. Detail comes later, one component at a time.

## 3. Then drive
1. Record the map and decisions in memory (`state.md` = map as a checklist, `decisions.md` = choices).
2. Work through components in order. For each, give the **component card** (below), do the AI-doable parts, and request only the approvals/credentials needed.
3. If the user doesn't answer a decision, proceed with the default and say so.
4. After each component: tick it in `state.md`, show progress in one line (`4/11 done — next: payments`), continue.

### Component card (when you open a component)
```
<COMPONENT> — what it is in one line
Why it matters: ...
Options (free/open first):   | option | cost | effort | fits when |
My recommendation: ... because ...
I'll do: ...            You do / approve: ...
Done when: <checkable result>
Hand-off: <skill name exactly as listed in references/universal-map.md>
```

## 4. Depth on demand
- Beginner asks "what is X?" → answer with a plain analogy first, then one precise sentence.
- "Explain more" → next level of detail, not a repeat.
- Expert → skip analogies, give specs, trade-offs, numbers.

## 5. Facts that go stale
Laws, taxes, fees, provider availability per country and prices change. Any number (price, budget, fee, timeline) not verified in this session is labelled `~estimate`. Sector packs list *what to check*, not final answers:
verify against current official sources before giving specifics, cite them, and add the date checked.
Legal, tax, medical and financial items end with preparation + "confirm with a qualified professional" where stakes are high.

## 6. Anti-patterns
Asking 8 questions before showing anything · a map without "who does it" · burying the next step ·
repeating the whole map every message · giving country-specific legal/tax claims from memory without verification ·
presenting paid tools without a free alternative · restarting the map in a new session instead of reading memory.
