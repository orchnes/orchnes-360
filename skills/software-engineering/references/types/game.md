# Games

## Layers
| Layer | Contents |
|---|---|
| Engine / platform | rendering, physics, audio, input, asset loading (Unity, Unreal, Godot, custom) |
| Core systems | game loop, scene management, save/load, networking |
| Gameplay | rules, entities/components, AI, progression — data-driven where possible |
| Presentation | UI/HUD, VFX, camera, audio cues |
| Content / data | levels, configs, balance tables, localization |

Rules: fixed timestep for simulation, variable for rendering; gameplay rules separated from engine callbacks so they're testable;
designers tune data, not code (configs/ScriptableObjects/resources); avoid per-frame allocations in hot loops;
in multiplayer the server is authoritative — never trust the client.
Watch: frame budget (16.6 ms @60 fps), GC spikes, load times, memory on target hardware, save-file versioning,
determinism for replays/lockstep, input latency, platform certification requirements.

## Typical tests
Unit tests for gameplay rules; automated playthrough/smoke tests; performance captures on target devices;
save/load round-trip and migration tests.
