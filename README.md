# agent-skills

Portable, token-efficient skills for AI agents. MIT licensed.

Each skill is a folder with a `SKILL.md` following the open **Agent Skills** format
(YAML frontmatter + Markdown instructions). Only a skill's name and description sit in the
model's context until the skill is needed, so installing many skills costs almost nothing.

## Skills

| Skill | What it does |
|---|---|
| [`autonomous-loop`](skills/autonomous-loop/SKILL.md) | Goal-driven loop: a cheap worker model iterates, a top-ranked supervisor model only diagnoses, shows correct patterns, designs tests and signs off. Built-in stall detection and hard stops. |
| [`planner`](skills/planner/SKILL.md) | End-to-end planning: frame → discover → decide → break down → de-risk → ship. |
| [`software-engineering`](skills/software-engineering/SKILL.md) | Universal engineering rules + architecture layers, with per-type guides: web, mobile, desktop, embedded/IoT, CLI/library, data/ML, games, distributed. |
| [`token-economy`](skills/token-economy/SKILL.md) | Cut token/context usage: targeted search, partial reads, filtered output, batching, delegation. |

### Roadmap
`memory` · `diagrams-mapping` · `visual-design` (escape generic AI aesthetics) ·
`root-cause-analysis` · `codebase-analysis`

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
