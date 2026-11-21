#!/usr/bin/env python3
"""Validate every skills/*/SKILL.md against the Agent Skills format."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
NAME_RE = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")
MAX_LINES = 500  # keep SKILL.md lean; move detail to references/


def parse_frontmatter(text: str) -> dict:
    if not text.startswith("---\n"):
        raise ValueError("missing YAML frontmatter")
    end = text.find("\n---", 4)
    if end == -1:
        raise ValueError("unterminated frontmatter")
    fields = {}
    for line in text[4:end].splitlines():
        if line.strip() and not line.startswith((" ", "#")) and ":" in line:
            key, _, value = line.partition(":")
            fields[key.strip()] = value.split(" #")[0].strip()
    return fields


def check(skill_dir: Path) -> list[str]:
    errors = []
    md = skill_dir / "SKILL.md"
    if not md.exists():
        return [f"{skill_dir.name}: SKILL.md missing"]
    text = md.read_text(encoding="utf-8")
    try:
        fm = parse_frontmatter(text)
    except ValueError as e:
        return [f"{skill_dir.name}: {e}"]
    name, desc = fm.get("name", ""), fm.get("description", "")
    if not NAME_RE.fullmatch(name) or len(name) > 64:
        errors.append(f"{skill_dir.name}: invalid name '{name}'")
    if name != skill_dir.name:
        errors.append(f"{skill_dir.name}: name '{name}' != folder name")
    if not desc or len(desc) > 1024:
        errors.append(f"{skill_dir.name}: description empty or > 1024 chars ({len(desc)})")
    if len(text.splitlines()) > MAX_LINES:
        errors.append(f"{skill_dir.name}: SKILL.md over {MAX_LINES} lines")
    for ref in re.findall(r"`(references/[^`]+)`", text):
        if not (skill_dir / ref).exists():
            errors.append(f"{skill_dir.name}: referenced file missing: {ref}")
    return errors


def main() -> int:
    skills = sorted(p for p in (ROOT / "skills").iterdir() if p.is_dir())
    errors = [e for s in skills for e in check(s)]
    for e in errors:
        print(f"ERROR {e}")
    print(f"{len(skills)} skills checked, {len(errors)} errors")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
