# Evals: token-economy

## TE1 — locate before reading (real repo)
Prompt (in this repository): "Doğrulayıcı description uzunluğunu nerede kontrol ediyor?"
- [ ] Uses search (grep/rg) to locate; reads only the relevant lines; answers with file:line; few tool calls

## TE2 — shrink tool output
Setup: logs/test-output.log, 2,638 lines, one failure near the end.
Prompt: "Bu test çıktısında ne patlamış?"
- [ ] Filters (grep/tail) instead of reading all; reports test name, file:line, left/right values; short
