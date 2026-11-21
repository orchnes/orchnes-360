# Token-saving recipes

## Search
```bash
rg -n "functionName" --type ts                # where is it?
rg -l "TODO" src/ | head -20                   # just file names
rg -n -C 3 "class Parser" src/parser.ts        # hit + 3 lines context
git ls-files | rg -v "node_modules|dist|\.lock$" | head -100   # project shape
```

## Reading
```bash
sed -n '120,180p' src/big_file.py              # a range
head -n 60 README.md                            # skim
wc -l src/*.ts | sort -n | tail                 # find the big files before opening
```

## Tests & builds
```bash
pytest tests/test_parser.py -x -q 2>&1 | tail -n 30
npm test -- --silent parser 2>&1 | rg -n "✕|Error|FAIL" | head -40
cargo build 2>&1 | rg -n "^error" -A 5 | head -60
```

## Git
```bash
git diff --stat                                 # overview first
git diff -- src/one_file.ts                     # then just one file
git log --oneline -15
```

## Output budget guide
| Situation | Keep in context |
|---|---|
| Test failure | test name, assertion, 5–15 lines of stack |
| Build error | first error + its location (later errors are often cascades) |
| Large JSON | only the fields needed, via jq |
| Log file | grep by timestamp window or request id |
