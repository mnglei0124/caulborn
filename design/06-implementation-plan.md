# Implementation Plan — Vertical Slice (The Fallows)

Engine: **Godot 4.x, standard build, GDScript** (ledger decision #9). Strategy: build the battle engine against the *hardest* spec we have (Bell, `encounters/bell.md`) so every system is proven before we scale it to the rest of the chapter.

## Project layout (res://)
```
game/
  main.tscn            # boot scene (placeholder until overworld exists)
  autoload/            # singletons: game_state.gd (done), later: save_system, audio_bus
  battle/              # encounter runner, box, flame player, menu UI
    patterns/          # one scene/script per named pattern; school base classes
  overworld/           # player controller, rooms, candles, interactables
  dialogue/            # dialogue runner + box UI
  ui/                  # shared theme, fonts, transitions
data/
  encounters/          # encounter definitions (phases, verbs, tempest rules) as .tres resources
  dialogue/            # dialogue scripts as data files
assets/
  sprites/  audio/  fonts/
design/                # docs only — never loaded by the game
```

## Architecture decisions
- **Battle = a state machine scene** (`battle/encounter_runner.tscn`): `MENU → PLAYER_ACTION → DODGE → RESOLVE → (loop | end)`. The runner consumes an **EncounterDef resource** (phases, dialogue keys, verbs, tempest drivers, pattern refs) so encounters are data, not code — new fights shouldn't need new engine features after M4.
- **Patterns are scenes.** Base class `BulletPattern` (spawning, lifetime, box-relative coords); per-school bases encode grammar defaults (`HushPattern`: slow/dense/lattice helpers, etc. per 02-magic-system's table). Named patterns like Lullaby Lattice subclass those.
- **The box supports zones** (Bell's Gate/Hearth mercy mechanic is engine-level, not a hack — zone occupancy is queryable by any encounter).
- **Dialogue: custom and minimal**, data-driven with flag get/set hooks into GameState. No addon dependency — our flags/morality integration is the whole point. Revisit only if writing volume hurts.
- **Saves = candles**: serialize GameState to JSON in `user://`. Death-loop = reload last candle + Guest commentary hook.
- **Tabs, snake_case files, typed GDScript** wherever practical.

## Milestones (each ends with something runnable)
| # | Deliverable | Acceptance |
|---|---|---|
| M0 | Install Godot, open project, run it | Placeholder scene runs at 320×240, crisp scaling |
| M1 | Battle box + flame player + **Lullaby Lattice** | Dodge a looping lattice; hits reduce Wick; zones logged |
| M2 | Turn loop + menu (STRIKE/REACH/ITEM/STILL) | Full turns vs. a dummy encounter def; timed Strike bar |
| M3 | Tempest/verb system + defensive-cast plumbing | Verbs alter Tempest per data; STILL gates correctly (Hush-tap exists but is LOCKED in Ch.1 pre-Bell — ledger watch-list) |
| M4 | **Bell, complete** — all 4 outcomes, all 7 patterns | Playable per `encounters/bell.md` incl. softening, silence phase, ash offer |
| M5 | Overworld greybox: Fallows rooms, player, collisions, encounter triggers | Walk the Fallows, enter/exit battles |
| M6 | Dialogue runner + candles + the Guest | Save/load, death-loop to candle, Guest lines react to flags |
| M7 | Remaining Ch.1 roster (fauna ×3, gate-guard, Fenn) | Full slice playable start→gate with placeholder art |
| M8 | Art pass (per 00-vision palette rules) | Placeholder → real sprites/tiles; desaturation shader for the Thin |
| M9 | Audio pass | Vigil theme + lullaby arrangement; Bell's silence phase lands |
| M10 | Slice complete: tuning, playtests vs. bell.md targets | Mercy first-clear in 3–5 attempts; all flags verified against ledger |

## Working method
Claude writes code/scenes and encounter data against the design docs; user runs in-editor and reports (screenshots welcome). Numbers in `encounters/bell.md` are provisional until M10 playtests — tuning changes get logged in the ledger, not silently applied.
