# agent-skills

Portable, token-efficient skills for AI agents. MIT licensed.

Each skill is a folder with a `SKILL.md` following the open **Agent Skills** format
(YAML frontmatter + Markdown instructions). Only a skill's name and description sit in the
model's context until the skill is needed, so installing many skills costs almost nothing.

## Skills

| Skill | What it does |
|---|---|
| [`agent-behavior`](skills/agent-behavior/SKILL.md) | Baseline for every session: short, evidence-backed, human answers; no false "done", no loops, no restarting; ask only for secrets, approvals and real decisions. |
| [`agent-orchestra`](skills/agent-orchestra/SKILL.md) | Run a team of agents: a top model decomposes, routes each task to the cheapest capable (free/local first) model, reviews against contracts, rejects bloat, teaches with playbooks, logs decisions and cost. |
| [`autonomous-loop`](skills/autonomous-loop/SKILL.md) | Goal-driven loop: a cheap worker model iterates, a top-ranked supervisor model only diagnoses, shows correct patterns, designs tests and signs off. Built-in stall detection and hard stops. |
| [`codebase-analysis`](skills/codebase-analysis/SKILL.md) | Analyze any repo end to end: architecture map, quality & tech debt, security review, onboarding guide — cheap recon first, every finding with file:line evidence. |
| [`content-social`](skills/content-social/SKILL.md) | Social media like a senior human manager: strategy, brand voice, calendar, platform-native posts, official-API scheduling, community replies, crisis escalation, analytics — user only logs in and approves. |
| [`guided-discovery`](skills/guided-discovery/SKILL.md) | Say a goal, get the whole map instantly: every component in plain language, who does it, ≤ 3 decisions with defaults — then the agent drives. Packs: e-commerce, healthcare, SaaS + universal map for any sector. |
| [`memory`](skills/memory/SKILL.md) | Persistent memory across sessions, agents and models: state, decisions, facts, user preferences — resume from the last open point, never restart. Works with CLAUDE.md, AGENTS.md and any tool. |
| [`planner`](skills/planner/SKILL.md) | End-to-end planning: frame → discover → decide → break down → de-risk → ship. |
| [`research`](skills/research/SKILL.md) | Evidence-based research: asks for access when missing, searches globally in local languages, primary sources first, cross-checks key claims, reports conflicts, answers with cited, dated evidence and confidence. |
| [`root-cause-analysis`](skills/root-cause-analysis/SKILL.md) | Evidence-driven RCA: reproduce → evidence → ranked hypotheses → cause behind the cause → proven fix → report. Guides for bugs, performance and production incidents. |
| [`software-engineering`](skills/software-engineering/SKILL.md) | Universal engineering rules + architecture layers, with per-type guides: web, mobile, desktop, embedded/IoT, CLI/library, data/ML, games, distributed. |
| [`workflow-automation`](skills/workflow-automation/SKILL.md) | Automations from plain language: short interview → spec → right platform (free/self-hosted first, or code) → built with idempotency, retries, alerts and approval steps → tested → runbook. |
| [`token-economy`](skills/token-economy/SKILL.md) | Cut token/context usage: targeted search, partial reads, filtered output, batching, delegation. |

### Roadmap
See [ROADMAP.md](ROADMAP.md) — vision, the full skill map (idea → company → brand → design → product → infrastructure → security → growth → AI), and the planned Rust orchestrator.

## Install

### Claude Code (plugin)
```
/plugin marketplace add <OWNER>/agent-skills
/plugin install agent-skills@agent-skills
```

### Claude Code (single skills, no plugin)
Copy any `skills/<name>/` folder to `~/.claude/skills/` (all projects) or `.claude/skills/` (one project).

### Claude.ai / Claude apps
Zip a skill folder and upload it under Settings → Capabilities → Skills.

### Other agents
Any agent that supports the Agent Skills format can load the `skills/<name>/` folders directly —
check your tool's docs for its skills directory. For agents without skills support, paste the
`SKILL.md` content into the system prompt / rules file (e.g. `AGENTS.md`).

## Design principles
1. **One skill, one job.** Focused descriptions trigger reliably.
2. **Lean `SKILL.md`.** Core procedure only; depth goes in `references/`, loaded on demand.
3. **Verifiable.** Every procedure ends in a checkable result, not "looks good".
4. **Vendor-neutral.** No dependency on a specific model or tool; tool-specific notes live in references.

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md). Run `python scripts/validate.py` before opening a PR.

## License
[MIT](LICENSE)
