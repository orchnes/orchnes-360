# Tool integrations

The `.memory/` files work everywhere because they are plain Markdown. What differs is which
index file each tool loads automatically. Check your tool's current docs — locations change.

| Tool | Auto-loaded index | Notes |
|---|---|---|
| Claude Code | `CLAUDE.md` (project root, also `~/.claude/CLAUDE.md` for all projects) | Can import other files with `@path`; may also keep its own auto-memory. |
| Codex | `AGENTS.md` (project root and parent dirs; global file in the Codex home dir) | |
| Other agents (Cursor, Copilot, Gemini CLI, Aider, …) | their rules/instructions file; many read `AGENTS.md` | Add one line pointing to `.memory/state.md`. |
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
