# Contributing to Orchnes 360

Thanks for helping! Please read the [code of conduct](CODE_OF_CONDUCT.md). Security issues go through [SECURITY.md](SECURITY.md), not public issues.

## Add a skill
1. Copy `templates/SKILL.template.md` to `skills/<your-skill>/SKILL.md`.
2. `name` must equal the folder name (lowercase, digits, hyphens, ≤ 64 chars).
3. `description` (≤ 1024 chars) must say **what** it does and **when** to use it, with phrases users actually type.
4. Keep `SKILL.md` lean (target < 200 lines). Put long material in `skills/<your-skill>/references/`
   and reference it by relative path.
5. Run `python scripts/validate.py` (it also fails if the eval file or README row is missing).
6. Add eval scenarios in `evals/<your-skill>.md` (prompts + pass checks).
7. Add the skill to the table in `README.md` and update `ROADMAP.md`.

## Quality bar
- Procedures end in a verifiable outcome.
- No vendor lock-in in the main `SKILL.md`; tool-specific setup goes in references.
- Test the skill on at least two realistic prompts and describe them in the PR.

## Pull requests
Small, focused PRs. One skill per PR when adding new skills.

## Maintainers: GitHub settings as code
`scripts/github-setup.sh` applies the repository settings for `orchnes/orchnes-360` and `orchnes/orchnes-cli`
(security features, Actions permissions, `main` ruleset, topics, releases). Run it with the GitHub CLI signed in as `orchnes`:
```bash
gh api repos/orchnes/orchnes-360/contents/scripts/github-setup.sh -H "Accept: application/vnd.github.raw" > github-setup.sh
bash github-setup.sh
```
