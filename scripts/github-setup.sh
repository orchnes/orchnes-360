#!/usr/bin/env bash
# Orchnes 360 — GitHub settings for orchnes/orchnes-360 and orchnes/orchnes-cli
#
# Run on your own computer:
#   1. Install GitHub CLI: https://cli.github.com
#   2. gh auth login          (sign in as the "orchnes" account)
#   3. bash scripts/github-setup.sh   (or download it: see the one-liner in CONTRIBUTING.md)
#
# Safe to run more than once: settings are overwritten, the ruleset is created only if
# missing, releases are created only if missing. Nothing is deleted.
set -euo pipefail

OWNER=orchnes
command -v gh >/dev/null || { echo "GitHub CLI (gh) is not installed: https://cli.github.com"; exit 1; }
login=$(gh api user --jq .login)
[ "$login" = "$OWNER" ] || { echo "Signed in as '$login'. Run: gh auth login (choose the $OWNER account)"; exit 1; }

ok()   { echo "  ✔ $1"; }
warn() { echo "  ⚠ $1"; }
put()  { gh api --method PUT "$1" --silent 2>/dev/null && ok "$2" || warn "$2 (failed — enable it under Settings in the web UI)"; }
json() { gh api --method "$1" "$2" --input - --silent 2>/dev/null && ok "$3" || warn "$3 (failed)"; }

configure() {
  local repo=$1 desc=$2 homepage=$3 topics=$4 check=$5 patterns=$6
  local R="repos/$OWNER/$repo"
  echo "== $OWNER/$repo"

  json PATCH "$R" "description, features, merge settings, secret scanning + push protection" <<EOF
{"description": "$desc", "homepage": "$homepage",
 "has_issues": true, "has_wiki": false, "has_projects": false, "has_discussions": true,
 "allow_merge_commit": false, "allow_squash_merge": true, "allow_rebase_merge": true,
 "delete_branch_on_merge": true, "allow_update_branch": true,
 "squash_merge_commit_title": "PR_TITLE", "squash_merge_commit_message": "PR_BODY",
 "security_and_analysis": {"secret_scanning": {"status": "enabled"},
                           "secret_scanning_push_protection": {"status": "enabled"}}}
EOF
  json PUT "$R/topics" "topics" <<<"{\"names\": $topics}"

  put "$R/vulnerability-alerts"             "Dependabot alerts"
  put "$R/automated-security-fixes"         "Dependabot security updates"
  put "$R/private-vulnerability-reporting"  "Private vulnerability reporting"

  json PUT "$R/actions/permissions" "Actions: only allowed actions" <<<'{"enabled": true, "allowed_actions": "selected"}'
  json PUT "$R/actions/permissions/selected-actions" "Actions: GitHub-owned + verified + allow list" \
    <<<"{\"github_owned_allowed\": true, \"verified_allowed\": true, \"patterns_allowed\": $patterns}"
  json PUT "$R/actions/permissions/workflow" "Workflow token: read-only" \
    <<<'{"default_workflow_permissions": "read", "can_approve_pull_request_reviews": false}'
  json PUT "$R/actions/permissions/fork-pr-contributor-approval" "Fork PRs need approval for external contributors" \
    <<<'{"approval_policy": "all_external_contributors"}'

  if gh api "$R/rulesets" --jq '.[].name' 2>/dev/null | grep -qx "Protect main"; then
    ok "ruleset 'Protect main' already exists"
  else
    json POST "$R/rulesets" "ruleset 'Protect main' (no deletion/force-push, PR + CI '$check' required, admin bypass)" <<EOF
{"name": "Protect main", "target": "branch", "enforcement": "active",
 "conditions": {"ref_name": {"include": ["~DEFAULT_BRANCH"], "exclude": []}},
 "bypass_actors": [{"actor_id": 5, "actor_type": "RepositoryRole", "bypass_mode": "always"}],
 "rules": [
   {"type": "deletion"},
   {"type": "non_fast_forward"},
   {"type": "pull_request", "parameters": {"required_approving_review_count": 0,
     "dismiss_stale_reviews_on_push": true, "require_code_owner_review": false,
     "require_last_push_approval": false, "required_review_thread_resolution": true}},
   {"type": "required_status_checks", "parameters": {"strict_required_status_checks_policy": false,
     "required_status_checks": [{"context": "$check"}]}}]}
EOF
  fi
}

release() {
  local repo=$1 tag=$2 title=$3
  if gh release view "$tag" --repo "$OWNER/$repo" >/dev/null 2>&1; then
    ok "release $tag already exists"; return
  fi
  # Notes = this version's section of CHANGELOG.md on main.
  local notes
  notes=$(gh api "repos/$OWNER/$repo/contents/CHANGELOG.md" -H "Accept: application/vnd.github.raw" \
          | awk -v v="${tag#v}" '$0 ~ "^## \\["v"\\]" {f=1; next} /^## \[/ {f=0} f')
  gh release create "$tag" --repo "$OWNER/$repo" --target main --title "$title" --notes "$notes" --latest >/dev/null \
    && ok "release $tag" || warn "release $tag (failed)"
}

configure orchnes-360 \
  "Orchnes 360 — end-to-end Agent Skills for AI agents: from idea to a running business, in any AI tool (Codex, Claude Code, Cursor, Copilot, Gemini CLI...)." \
  "https://github.com/$OWNER/orchnes-cli" \
  '["agent-skills","ai-agents","claude-code","codex","cursor","github-copilot","gemini-cli","llm","prompt-engineering","orchestration","skills"]' \
  skills '[]'

configure orchnes-cli \
  "orchnes — Orchnes 360 CLI in Rust: install Agent Skills into any AI agent, export to 9 formats, route tasks to model tiers and call any LLM through one gateway." \
  "https://github.com/$OWNER/orchnes-360" \
  '["rust","cli","agent-skills","ai-agents","llm","llm-gateway","orchestration","openai-compatible","anthropic","ollama"]' \
  check '["dtolnay/rust-toolchain@*"]'

echo "== releases"
release orchnes-360 v0.3.0 "Orchnes 360 v0.3.0"
release orchnes-cli v0.2.0 "orchnes v0.2.0"

echo
echo "Done. Do NOT enable CodeQL 'default setup' — the CodeQL workflow in each repo already scans."
echo "Still manual (account level): Settings → Password and authentication → enable 2FA for $OWNER."
