# Tool integrations

Verified 2026-11-22 (see docs/COMPATIBILITY.md in the repo). The `.memory/` files work everywhere because they are plain Markdown. What differs is which
index file each tool loads automatically. Check your tool's current docs — locations change.

| Tool | Auto-loaded index | Notes |
|---|---|---|
| Claude Code | `CLAUDE.md` or `.claude/CLAUDE.md` (project), `~/.claude/CLAUDE.md` (user) | Reads `AGENTS.md` only when no CLAUDE.md exists; otherwise put `@AGENTS.md` in CLAUDE.md. Auto-memory also exists. |
| Codex | `AGENTS.md` per directory from repo root to CWD; global `~/.codex/AGENTS.md` (or `AGENTS.override.md`) | combined default limit 32 KiB |
| Cursor, Copilot, Windsurf, Cline | read `AGENTS.md` natively | Add one line pointing to `.memory/state.md`. |
| Gemini CLI | `GEMINI.md`; AGENTS.md via `settings.json` `context.fileName` | |
| Aider | `CONVENTIONS.md` via `--read` | |
| Chat apps (Claude.ai, ChatGPT, …) | project instructions / custom instructions | Paste the index; upload `state.md` to the project's knowledge. |

## Supporting several tools in one repo
Keep the content in `AGENTS.md` and make the other index files point to it, e.g. a one-line `CLAUDE.md`:
```markdown
@AGENTS.md
```
(or a symlink), so there is a single source of truth.

## Git
- Commit `AGENTS.md`/`CLAUDE.md`, `decisions.md` and `facts.md` — they help every contributor.
- `state.md` and `user.md` are personal working memory: commit them for solo/agent-team projects,
  add them to `.gitignore` for shared repos.
- Never commit secrets; memory files go through the same review as code.

## Optional: memory servers
MCP memory/knowledge-graph servers or vector stores can complement the files for large knowledge bases.
Keep `state.md` as the human-readable source of truth for "what next".
