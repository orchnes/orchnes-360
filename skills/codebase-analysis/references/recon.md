# Recon commands (token-efficient)

```bash
# Shape: tracked files only, skip noise
git ls-files | grep -vE '(^|/)(node_modules|vendor|dist|build|\.venv|target)/|\.(lock|min\.js|map|svg|png|jpg)$' | head -300
git ls-files | sed 's|/.*||' | sort | uniq -c | sort -rn | head -20        # files per top-level dir

# Languages and size
git ls-files | sed -n 's/.*\.\([a-zA-Z0-9]*\)$/\1/p' | sort | uniq -c | sort -rn | head -15
command -v tokei >/dev/null && tokei --compact || command -v cloc >/dev/null && cloc --quiet .

# Identity
ls; head -n 80 README* 2>/dev/null
ls .github/workflows 2>/dev/null; ls Dockerfile* docker-compose* Makefile 2>/dev/null

# Entry points (adjust per language)
rg -n --max-count 3 -e 'func main\(' -e 'if __name__ == .__main__.' -e 'app\.listen\(' -e 'createServer' -e '@SpringBootApplication' -e 'fn main\(' .
rg -n -e '@(app|router)\.(get|post|put|delete)' -e 'router\.(get|post)' -e '@(Get|Post)Mapping' | head -40   # routes

# Activity and hotspots
git log --oneline -20
git log --since='6 months ago' --name-only --format='' | grep -v '^$' | sort | uniq -c | sort -rn | head -20   # churn
git shortlog -sn --since='1 year ago' | head -10

# Largest source files (complexity candidates)
git ls-files | grep -E '\.(py|js|ts|tsx|go|rs|java|kt|swift|c|cpp|cs|rb|php)$' | xargs wc -l 2>/dev/null | sort -rn | sed -n '2,16p'
```

Hotspot = high churn AND large/complex. These files deserve the deep dive first.
