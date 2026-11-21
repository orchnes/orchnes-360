# CLI tools & libraries/SDKs

## CLI layers
| Layer | Contents |
|---|---|
| Entry / argument parsing | commands, flags, help text, exit codes |
| Commands | one module per command, thin |
| Core | the actual logic, usable as a library |
| I/O adapters | filesystem, network, terminal output formatting |

Rules: core never prints or exits — it returns results/errors; the CLI layer formats them.
Exit code 0 only on success; errors to stderr, data to stdout; offer `--json` for machine output;
respect `NO_COLOR`, non-TTY, and `--quiet`; never prompt when not interactive; dry-run for destructive actions.

## Library/SDK layers
Public API (small, stable, documented) → internal implementation (free to change) → adapters.

Rules: minimize the public surface; semantic versioning — breaking changes only in majors, deprecate first;
no global side effects on import; don't force heavy dependencies (make optional); errors are typed and documented;
thread-safety and async behavior documented.

## Typical tests
Unit for core; golden/snapshot tests for CLI output; tests of the public API as a user would call it;
compatibility tests across supported runtime versions/OSes.
