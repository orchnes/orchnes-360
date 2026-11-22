#!/usr/bin/env bash
# Orchnes 360 — GitHub settings as code for the "orchnesai" organization and its repositories.
#
# What it does (safe to run more than once; nothing is deleted):
#   1. Organization profile, member defaults, Actions policy, code security defaults
#   2. Organization profile README (orchnesai/.github -> profile/README.md)
#   3. Moves orchnes/orchnes-360 and orchnes/orchnes-cli into orchnesai (old links redirect)
#   4. Repository settings: features, merge rules, security, Actions, "Protect main" ruleset, topics
#
# Run on your own computer, signed in as the account that owns the organization:
#   1. Install GitHub CLI: https://cli.github.com
#   2. gh auth login              (choose the "orchnes" account)
#   3. gh auth refresh -s admin:org   (lets the script change organization settings)
#   4. bash github-setup.sh
set -euo pipefail

ORG=orchnesai
OLD_OWNER=orchnes
REPOS=(orchnes-360 orchnes-cli)

command -v gh >/dev/null || { echo "GitHub CLI (gh) is not installed: https://cli.github.com"; exit 1; }
login=$(gh api user --jq .login)
role=$(gh api "orgs/$ORG/memberships/$login" --jq .role 2>/dev/null || true)
[ "$role" = "admin" ] || { echo "'$login' is not an owner of $ORG. Run: gh auth login (choose the owner account)"; exit 1; }

ok()   { echo "  ✔ $1"; }
warn() { echo "  ⚠ $1"; }
put()  { gh api --method PUT "$1" --silent 2>/dev/null && ok "$2" || warn "$2 (failed — set it in the web UI)"; }
json() { gh api --method "$1" "$2" --input - --silent 2>/dev/null && ok "$3" || warn "$3 (failed — set it in the web UI)"; }

# ---------------------------------------------------------------- 1. organization
echo "== organization $ORG"
json PATCH "orgs/$ORG" "profile and member defaults (members: read-only, no repo creation/forking)" <<EOF
{"name": "Orchnes 360",
 "description": "Open-source Agent Skills that take any AI from idea to a running business.",
 "blog": "https://github.com/$ORG/orchnes-360",
 "default_repository_permission": "read",
 "members_can_create_repositories": false,
 "members_can_create_public_repositories": false,
 "members_can_create_private_repositories": false,
 "members_can_create_pages": false,
 "members_can_fork_private_repositories": false,
 "web_commit_signoff_required": false}
EOF

json PUT "orgs/$ORG/actions/permissions" "Actions: all repos, only allowed actions" \
  <<<'{"enabled_repositories": "all", "allowed_actions": "selected"}'
json PUT "orgs/$ORG/actions/permissions/selected-actions" "Actions: GitHub-owned + verified + dtolnay/rust-toolchain" \
  <<<'{"github_owned_allowed": true, "verified_allowed": true, "patterns_allowed": ["dtolnay/rust-toolchain@*"]}'
json PUT "orgs/$ORG/actions/permissions/workflow" "Workflow token: read-only, cannot approve PRs" \
  <<<'{"default_workflow_permissions": "read", "can_approve_pull_request_reviews": false}'

# Code security defaults for every repo (current and new). CodeQL "default setup" is left alone on
# purpose: each repo runs its own CodeQL workflow, and default setup would conflict with it.
CFG_NAME="Orchnes secure defaults"
cfg_id=$(gh api "orgs/$ORG/code-security/configurations" --jq ".[] | select(.name==\"$CFG_NAME\") | .id" 2>/dev/null || true)
if [ -z "$cfg_id" ]; then
  base='"name": "'"$CFG_NAME"'", "description": "Dependabot, secret scanning + push protection, private vulnerability reporting",
        "dependency_graph": "enabled", "dependabot_alerts": "enabled", "dependabot_security_updates": "enabled",
        "secret_scanning": "enabled", "secret_scanning_push_protection": "enabled",
        "private_vulnerability_reporting": "enabled", "code_scanning_default_setup": "not_set", "enforcement": "enforced"'
  # Try with the extra secret-scanning checks first; fall back if the plan does not offer them.
  cfg_id=$(gh api --method POST "orgs/$ORG/code-security/configurations" --input - --jq .id 2>/dev/null <<<"{$base,
             \"secret_scanning_validity_checks\": \"enabled\", \"secret_scanning_non_provider_patterns\": \"enabled\"}" \
        || gh api --method POST "orgs/$ORG/code-security/configurations" --input - --jq .id 2>/dev/null <<<"{$base}" \
        || true)
  [ -n "$cfg_id" ] && ok "code security configuration '$CFG_NAME' created" || warn "code security configuration (failed)"
else
  ok "code security configuration '$CFG_NAME' already exists"
fi

# ---------------------------------------------------------------- 2. profile README
echo "== profile README ($ORG/.github)"
if ! gh api "repos/$ORG/.github" --silent 2>/dev/null; then
  json POST "orgs/$ORG/repos" "repository $ORG/.github" \
    <<<'{"name": ".github", "description": "Organization profile and default community files", "visibility": "public", "auto_init": true, "has_wiki": false, "has_projects": false}'
  sleep 3
fi
readme=$(cat <<'MD'
## Orchnes 360

Open-source **Agent Skills** that take any AI from idea to a running business, in any AI tool
(Claude Code, Codex, Cursor, Copilot, Gemini CLI and more).

| Repository | What it is |
|---|---|
| [**orchnes-360**](https://github.com/orchnesai/orchnes-360) | 26 skills: planning, software engineering, security, infrastructure, company setup, commerce, growth, research, analysis, daily assistant |
| [**orchnes-cli**](https://github.com/orchnesai/orchnes-cli) | Rust CLI: install skills into any agent, export to 9 formats, route tasks to model tiers, call any LLM through one gateway |

**Principles:** short and evidence-based answers, no false "done", human approval for irreversible steps, lowest-cost option first.

MIT licensed · Security reports: use *Report a vulnerability* on the repository's Security tab.
MD
)
sha=$(gh api "repos/$ORG/.github/contents/profile/README.md" --jq .sha 2>/dev/null || true)
content=$(printf '%s\n' "$readme" | base64 | tr -d '\n')
if [ -n "$sha" ]; then
  gh api --method PUT "repos/$ORG/.github/contents/profile/README.md" -f message="Update profile README" \
    -f content="$content" -f sha="$sha" --silent 2>/dev/null && ok "profile README updated" || warn "profile README (failed)"
else
  gh api --method PUT "repos/$ORG/.github/contents/profile/README.md" -f message="Add profile README" \
    -f content="$content" --silent 2>/dev/null && ok "profile README added" || warn "profile README (failed)"
fi

# ---------------------------------------------------------------- 3. move repositories
echo "== move repositories into $ORG"
for repo in "${REPOS[@]}"; do
  if gh api "repos/$ORG/$repo" --jq .owner.login 2>/dev/null | grep -qx "$ORG"; then
    ok "$repo already in $ORG"; continue
  fi
  if gh api --method POST "repos/$OLD_OWNER/$repo/transfer" -f new_owner="$ORG" --silent 2>/dev/null; then
    for _ in $(seq 1 30); do
      gh api "repos/$ORG/$repo" --jq .owner.login 2>/dev/null | grep -qx "$ORG" && break; sleep 2
    done
    ok "$OLD_OWNER/$repo → $ORG/$repo (old links redirect; do not create a new $OLD_OWNER/$repo)"
  else
    warn "transfer of $repo failed — Settings → General → Danger Zone → Transfer"
  fi
done

[ -n "${cfg_id:-}" ] && {
  json POST "orgs/$ORG/code-security/configurations/$cfg_id/attach" "security defaults attached to all repos" <<<'{"scope": "all"}'
  json PUT "orgs/$ORG/code-security/configurations/$cfg_id/defaults" "security defaults applied to new repos" <<<'{"default_for_new_repos": "all"}'
}

# ---------------------------------------------------------------- 4. repositories
configure() {
  local repo=$1 desc=$2 homepage=$3 topics=$4 check=$5
  local R="repos/$ORG/$repo"
  echo "== $ORG/$repo"

  json PATCH "$R" "description, features, merge settings, secret scanning + push protection" <<EOF
{"description": "$desc", "homepage": "$homepage",
 "has_issues": true, "has_wiki": false, "has_projects": false, "has_discussions": true,
 "allow_merge_commit": false, "allow_squash_merge": true, "allow_rebase_merge": true,
 "allow_auto_merge": true, "delete_branch_on_merge": true, "allow_update_branch": true,
 "squash_merge_commit_title": "PR_TITLE", "squash_merge_commit_message": "PR_BODY",
 "security_and_analysis": {"secret_scanning": {"status": "enabled"},
                           "secret_scanning_push_protection": {"status": "enabled"}}}
EOF
  json PUT "$R/topics" "topics" <<<"{\"names\": $topics}"

  put "$R/vulnerability-alerts"             "Dependabot alerts"
  put "$R/automated-security-fixes"         "Dependabot security updates"
  put "$R/private-vulnerability-reporting"  "Private vulnerability reporting"

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
 "bypass_actors": [{"actor_id": 5, "actor_type": "RepositoryRole", "bypass_mode": "always"},
                   {"actor_id": 1, "actor_type": "OrganizationAdmin", "bypass_mode": "always"}],
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

configure orchnes-360 \
  "Orchnes 360 — end-to-end Agent Skills for AI agents: from idea to a running business, in any AI tool (Codex, Claude Code, Cursor, Copilot, Gemini CLI...)." \
  "https://github.com/$ORG/orchnes-cli" \
  '["agent-skills","ai-agents","claude-code","codex","cursor","github-copilot","gemini-cli","llm","prompt-engineering","orchestration","skills"]' \
  skills

configure orchnes-cli \
  "orchnes — Orchnes 360 CLI in Rust: install Agent Skills into any AI agent, export to 9 formats, route tasks to model tiers and call any LLM through one gateway." \
  "https://github.com/$ORG/orchnes-360" \
  '["rust","cli","agent-skills","ai-agents","llm","llm-gateway","orchestration","openai-compatible","anthropic","ollama"]' \
  check

echo
echo "Done. Still manual (web UI only):"
echo "  • Account $login: Settings → Password and authentication → enable 2FA"
echo "  • Then org $ORG: Settings → Authentication security → Require two-factor authentication"
echo "  • Claude GitHub app: give it access to the $ORG repositories (github.com/organizations/$ORG/settings/installations)"
echo "  • Do NOT enable CodeQL 'default setup' — each repo's CodeQL workflow already scans."
