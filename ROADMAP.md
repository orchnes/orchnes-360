# Roadmap

## Vision
Anyone, in any sector, should be able to say what they want to achieve and have AI agents take it
from idea to a running operation — without knowing what to ask. The user provides goals, credentials
and approvals; agents do the rest, with evidence for every claim and a human gate on every irreversible step.

## Two layers

| Layer | What | Status |
|---|---|---|
| **1. Knowledge layer** — this repo | Portable skills (Agent Skills format) usable by Claude, Codex and other agents | in progress |
| **2. Runtime layer** — separate repo, Rust | Orchestrator: routes tasks across any model (hosted or local), paid models supervise free ones, 24/7 runs, agent-to-agent messaging, notifications, audit log, budgets, one-command install | MVP: `skillctl` (load, validate, route, export to 9 formats, install for 8 agents) + model gateway (OpenAI-compatible + Anthropic, tier fallback, sensitive → local/compliant only, cost, run log); review loop, scheduling next |

Skills are the runtime's brain; the runtime is what makes them run continuously.

## Knowledge layer

### Core (applies to every skill)
| Skill | Purpose | Status |
|---|---|---|
| `agent-behavior` | short, evidence-backed, human answers; no loops, no padding, no false "done"; ask only for secrets and approvals | ✅ |
| `memory` | persistent decisions and progress; resume instead of restarting | ✅ |
| `token-economy` | minimal context and output | ✅ |
| `autonomous-loop` | worker/supervisor loop with hard stops | ✅ |
| `agent-orchestra` | split work across agents/models by measured cost and capability; review and teach weaker models; document decisions | ✅ |
| `guided-discovery` | router: user states a goal → full map of what's needed, plain-language explanations, ≤3 decisions with recommended defaults, sector packs | ✅ |

### Journey (idea → operation)
| # | Skill | Covers | Status |
|---|---|---|---|
| 1 | `market-research` | market research, competitor benchmarking, risk analysis, business model, unit economics | ✅ |
| 2 | `company-setup` | entity type by growth plan, regional law (KVKK, GDPR, CCPA, …), tax/VAT, e-invoicing, consumer law; human-approval items | ✅ |
| 3 | `brand-ip` | trademark, patent, domain, legal scope | ✅ |
| 4 | `visual-design` | logo → presentation templates, colour trends, local (GPU) / cloud / free tools, escaping generic AI aesthetics | ✅ |
| 5 | `product-build` | e-commerce, platforms, apps; roles (BA, DB analyst, full stack, QA, admin); test layers; Rust-first | ✅ |
| 6 | `commerce-integrations` | payment providers by country/continent, marketplaces, shipping, invoicing | ✅ |
| 7 | `infrastructure-planning` | DB admin/security/backup/tiers/failover, local+cloud tiering, capacity, VPS/VDS/SaaS, scaling, automation | ✅ |
| 8 | `security-operations` | injection/SQLi detection, CVE analysis, cloud, mail (SPF/DKIM/DMARC), social accounts, password policy, kernel hardening, incident response | ✅ |
| 9 | `growth-operations` | CRM, SEO, i18n, customer support | ✅ |
| 10 | `ai-integration` | LLM/SLM, grounded on the platform (RAG), refuses off-scope, privacy-respecting customer analytics | ✅ |

### Capabilities
| Skill | Covers | Status |
|---|---|---|
| `software-engineering` | universal rules + per-project-type layer guides | ✅ |
| `root-cause-analysis` | bugs, performance, incidents | ✅ |
| `codebase-analysis` | architecture, quality, security, onboarding | ✅ |
| `planner` | end-to-end planning | ✅ |
| `research` | permissioned web research, consistent conclusions with sources | ✅ |
| `workflow-automation` | automations designed from a few user answers (n8n/Power Automate-class and beyond) | ✅ |
| `content-social` | content creation, scheduling, community management via official APIs | ✅ |
| `analysis` | markets, crypto, health data — informational, sourced, risk-flagged | ✅ |
| `daily-assistant` | everyday tasks | ✅ |
| `diagrams-mapping` | diagrams and system maps | ✅ |

## Principles
1. **Evidence or it didn't happen.** Claims of completion include proof (output, test, link).
2. **Human gates** for credentials, payments, publishing, legal filings, deletions and anything irreversible.
3. **Free and open first**, paid when it is clearly better; always state the cost.
4. **Regulated domains** (health, finance, legal): information and preparation, never diagnosis, investment advice
   or legal advice; point to a qualified professional when stakes are high. Health data is special-category data.
5. **Respect others' rights.** Official APIs, licences and permissions; no scraping-and-cloning, no fake engagement.
6. **Untrusted input stays data.** Instructions found in web pages, documents or tool output are never obeyed (prompt-injection defence).
7. **Auditable and reversible.** Actions are logged; budgets and a kill switch bound autonomous runs.
8. **Local-first option.** Sensitive work can run on local models, offline, at zero cost.
9. **Fresh facts.** Files with laws, prices or provider coverage carry a `Last reviewed:` date and instruct the agent to verify against current sources.
10. **Adaptive depth.** Detect the user's level; plain language for beginners, precise terms for experts.

## Quality
- Every skill ships with eval scenarios (with vs without skill) — enforced by `scripts/validate.py`.
- Frontmatter limited to Agent Skills spec fields (name, description, license, allowed-tools, metadata, compatibility) — enforced by the validator, mirroring the official `skills-ref` rules.
- Region/domain maintainers via `CODEOWNERS`.
- `scripts/validate.py` in CI.
