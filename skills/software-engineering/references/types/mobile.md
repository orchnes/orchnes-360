# Mobile (iOS, Android, cross-platform)

## Layers
| Layer | Contents |
|---|---|
| UI | screens/views/widgets (SwiftUI, Compose, Flutter, React Native) |
| Presentation | ViewModel / BLoC / store: UI state, user intents |
| Domain | use cases, entities |
| Data | repositories combining remote + local sources |
| Platform | network client, local DB, secure storage, push, sensors, permissions |

Rules: UI observes state, never calls network directly; repositories decide cache vs network (offline-first where it matters);
all I/O off the main thread; survive process death and configuration changes (restore state).
Watch: battery and data usage, app size, startup time, permission UX (ask in context), deep links,
secure storage for tokens (Keychain/Keystore), certificate pinning where required, store review rules,
backward compatibility with older OS versions and older API clients (users don't update immediately).

## Typical tests
Unit for ViewModels and use cases; integration for repositories; a few UI/e2e tests on real devices/emulators;
screenshot tests for key screens across sizes, dark mode and large fonts.
