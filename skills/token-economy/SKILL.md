---
name: token-economy
description: Minimize token and context usage while keeping answer quality — targeted search before reading, partial file reads, no re-reading, compact tool output, batching, delegation, and terse responses. Use for any long or large-codebase task, when the user mentions tokens, cost, context limits, "be efficient", "save tokens", or when context is filling up.
license: MIT
---

# Token Economy

Every token in context is paid for on every later turn. Spend early tokens to avoid later ones.

## 1. Locate before you read
- Search (grep/glob/symbol search) for the exact identifier first; read only matching files.
- Read line ranges around the hit, not whole files. Expand only if needed.
- Never read generated, vendored, lock, minified or binary files unless the task is about them.

## 2. Never pay twice
- Do not re-read a file you already have in context and haven't changed.
- Do not re-derive facts already established; reference them.
- Persist durable facts (build commands, architecture notes, decisions) in a memory/notes file so future sessions don't rediscover them.

## 3. Shrink tool output
- Pipe long output through filters: `| tail -n 40`, `| grep -E "FAIL|Error"`, `--quiet`, `--json | jq '<field>'`.
- Run only the relevant test subset during iteration; the full suite once at the end.
- When output is long, keep only the error signature + the minimal context.

## 4. Batch and delegate
- Issue independent tool calls together in one step.
- Push broad, exploratory searches to a sub-agent/cheaper model and keep only its conclusion.
- Use the cheapest model that can do the sub-task (see the `autonomous-loop` skill tiers).

## 5. Write less
- Answer first, no preamble, no restating the question, no recap of what was just shown.
- Show diffs or changed snippets, not entire files.
- No speculative alternatives unless asked; give one recommendation.
- Code comments only where intent isn't obvious.

## 6. Stop early
- When the done criteria are met, stop. Don't polish unrequested parts.
- If blocked on a user decision, ask one precise question instead of exploring every branch.

## Quick self-check before each action
1. Do I already know this? → don't fetch it.
2. Can I fetch a smaller slice? → do that.
3. Can these calls run together? → batch them.
4. Will this output be long? → filter it.

Measured techniques and command recipes: `references/recipes.md`.
