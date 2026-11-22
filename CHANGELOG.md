# Changelog

All notable changes to Orchnes 360 are documented here. Versions follow [Semantic Versioning](https://semver.org/).

## [Unreleased]
### Changed
- Repository moved to the `orchnesai` organization: links, badges and install commands now use `github.com/orchnesai/...` (old `github.com/orchnes/...` links redirect).

## [0.3.0] — 2026-11-22
### Added
- Project renamed to **Orchnes 360**; Claude Code plugin and marketplace name `orchnes-360`.
- Verified compatibility matrix for OpenAI Codex, Claude Code, Claude.ai, Cursor, GitHub Copilot, Gemini CLI, Windsurf, Cline, Aider, Continue, ChatGPT and plain LLM APIs (`docs/COMPATIBILITY.md`).
- Turkish README (`README.tr.md`).
- Community files: code of conduct, security policy, issue and pull request templates.
### Changed
- Install section rewritten with officially documented paths (`.agents/skills/` covers Codex, Cursor, Copilot, Gemini CLI, Windsurf).
- Validator enforces Agent Skills spec frontmatter fields (mirrors the official `skills-ref` rules) and requires an eval file and README row per skill.

## [0.2.0] — 2026-11-22
### Added
- Skills: `analysis`, `daily-assistant`, `diagrams-mapping`, `growth-operations`, `market-research`, `brand-ip`, `company-setup`, `commerce-integrations`, `product-build`, `ai-integration`, `infrastructure-planning`, `security-operations`, `visual-design`, `content-social`, `workflow-automation`, `research`, `agent-orchestra`, `guided-discovery`, `memory`, `agent-behavior`.
- Eval scenarios for all 26 skills with recorded results (`evals/`, `evals/results/`).

## [0.1.0] — 2026-11-21
### Added
- First skills: `autonomous-loop`, `planner`, `token-economy`, `software-engineering`, `root-cause-analysis`, `codebase-analysis`.
- Claude Code plugin manifest, validator script and CI workflow.
