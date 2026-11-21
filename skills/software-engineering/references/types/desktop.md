# Desktop (native, Electron/Tauri, Qt, .NET)

## Layers
| Layer | Contents |
|---|---|
| UI / views | windows, dialogs, menus (MVVM common) |
| Presentation | view models, commands, undo/redo stack |
| Application / Domain | documents, rules, workflows |
| Platform services | filesystem, OS integration, updater, IPC, native modules |

Rules: never block the UI thread; long work in background with progress + cancel;
in Electron/Tauri keep a strict boundary between renderer (untrusted) and main/backend (privileged) — expose minimal typed IPC;
autosave and crash recovery for user documents.
Watch: cross-platform paths/line endings/case sensitivity, code signing and notarization, auto-update integrity,
high-DPI, keyboard shortcuts per OS convention, memory growth in long sessions, file locks.

## Typical tests
Unit for domain and view models; integration for file formats (round-trip load/save); smoke UI tests per OS.
