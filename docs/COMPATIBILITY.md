# Compatibility with AI agents and LLM apps

Last verified: 2026-11-22 against each tool's official documentation (pages opened that day; summaries of page content, not exhaustive).
Tools change quickly — if something here is outdated, please open an issue or PR with the source.

These skills follow the open **Agent Skills** specification (agentskills.io): a folder per skill with `SKILL.md`
(`name` 1–64 chars `[a-z0-9-]` matching the folder, `description` ≤ 1024 chars, optional `license`). All 26 skills conform.

## Native skills support

| Tool | Project path | User path | Notes | Source |
|---|---|---|---|---|
| **OpenAI Codex** (CLI / IDE / ChatGPT) | `.agents/skills/<name>/` (CWD up to repo root) | `~/.agents/skills/` (admin: `/etc/codex/skills`) | invoke with `$` or `/skills`, or implicitly by description | learn.chatgpt.com/docs/build-skills |
| **Claude Code** | `.claude/skills/<name>/` | `~/.claude/skills/` | also as a plugin (`/plugin`); `/skill-name` or automatic | code.claude.com/docs/en/skills |
| **Claude.ai apps** | — | upload a zip | Customize → Skills → + → Upload; folder name must match `name`; code execution must be enabled | support.claude.com (article 12512180) |
| **Cursor** | `.agents/skills/`, `.cursor/skills/` (also reads `.claude/skills/`, `.codex/skills/`) | `~/.agents/skills/`, `~/.cursor/skills/` | `name` must match folder | cursor.com/docs/context/skills |
| **GitHub Copilot** (cloud agent, code review, CLI, app, VS Code agent mode) | `.github/skills/`, `.agents/skills/`, `.claude/skills/` | `~/.copilot/skills/`, `~/.agents/skills/` | | docs.github.com (create skills) |
| **Gemini CLI** | `.gemini/skills/`, `.agents/skills/` | `~/.gemini/skills/`, `~/.agents/skills/` | `gemini skills install <git-url-or-path> --consent`; ⚠ Google states Gemini CLI was replaced by "Antigravity CLI" for some user tiers on 2026-06-18 — not verified here | geminicli.com/docs/cli/skills/ |
| **Windsurf (Devin Desktop)** | `.agents/skills/`, `.devin/skills/`, legacy `.windsurf/skills/` | `~/.agents/skills/`, `~/.config/devin/skills/` | | docs.devin.ai (cascade/memories) |
| **Cline** | `.cline/skills/`, `.clinerules/skills/`, `.claude/skills/` | `~/.cline/skills/` | | docs.cline.bot/customization/skills |

**Shortcut:** copying the `skills/*` folders to **`.agents/skills/`** covers Codex, Cursor, Copilot, Gemini CLI and Windsurf.
Add `.claude/skills/` for Claude Code and Cline.

## Instruction-file fallbacks (tools without skills, or for always-on rules)

| Tool | File | Format |
|---|---|---|
| AGENTS.md readers (Codex, Cursor, Copilot, Windsurf, Cline; Claude Code only when no CLAUDE.md exists) | `AGENTS.md` | plain Markdown; Codex merges root→CWD, default 32 KiB limit |
| Claude Code | `CLAUDE.md` (can contain `@AGENTS.md`) | plain Markdown |
| Cursor rules | `.cursor/rules/<name>.mdc` | frontmatter `description`, `globs`, `alwaysApply` |
| GitHub Copilot | `.github/copilot-instructions.md`; `.github/instructions/<name>.instructions.md` | path files need frontmatter `applyTo: "<glob>"` |
| Gemini CLI | `GEMINI.md` | Markdown; read AGENTS.md via `settings.json` → `{"context":{"fileName":["AGENTS.md","GEMINI.md"]}}` |
| Windsurf | `.windsurf/rules/*.md`, `.devin/rules/*.md` | frontmatter `trigger: always_on | glob | model_decision | manual` |
| Cline | `.clinerules/` or `.cline/rules/` | optional frontmatter `paths` |
| Continue | `.continue/rules/*.md` | frontmatter `name`, `description`, `globs`, `alwaysApply` |
| Aider | `CONVENTIONS.md` | load with `aider --read CONVENTIONS.md` or `read:` in `.aider.conf.yml` |
| ChatGPT (chat) | Custom instructions / project instructions | paste a short bundle; custom instructions limit 1,500–5,000 chars by plan |
| Any LLM via API | system prompt | load all `name` + `description` first; inject a skill's body when relevant (progressive disclosure) |

## Not verified yet
Zed rules (docs page 404) · JetBrains Junie / AI Assistant paths · Aider and Continue AGENTS.md support · ChatGPT project/GPT knowledge limits ·
Windsurf `trigger` frontmatter for `.windsurf/rules/` (documented for `.devin/rules/`) · Gemini CLI skill frontmatter and Antigravity CLI behaviour.
Contributions with official sources are welcome.
