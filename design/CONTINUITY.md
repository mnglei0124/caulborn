# CONTINUITY LEDGER
Canon facts, open decisions, and contradiction watch-list. I (Claude) maintain this as the story grows — every new idea gets checked against it, and every session that adds canon updates it. Rule: if it's not in the ledger or the numbered docs, it's not canon yet.

## Hard canon (locked)
- **World:** the Lumen, sealed inside the Caul. No sun/stars/weather-from-above in any living character's speech (Founders-era texts, dreams, scripture only).
- **History:** three-layer truth (Refuge Myth → Quarantine → Sheltered Monster). Layer 3: the Ward WAS the Sundering; the Founders spared it; magic is its leaked vitality. "Magic is what mercy did with a monster."
- **Magic:** five schools = five emotional stances (Hush/Fervor/Rue/Vim/Wit). No stance, no cast. Costs: Breath (personal), the Fade/Thin (cumulative), the Fray (civilizational). Hush blocks magic, never matter. Vim cannot heal Thin. No resurrection. Casters sense stance, not thoughts.
- **Player:** outsider, threadless, casts via the Ward's direct reach; casting does not Fray the Caul; death-loops = the Ward refusing the dream's end. Default name Lark.
- **Threadless:** cannot cast, cannot Fade, do not Fray — only hands that can touch the Caul (hidden until Ch.5, Fenn).
- **The Guest:** previous faller, centuries ago, kept in the dream, aware of loops, cannot gutter, Wit master, wants out through the player. Never uses the player's chosen name.
- **Timekeeping:** brights/dims (days), Vigils (years). Ossian: sixty Vigils enthroned.
- **Cast:** Bell (Hush, Thinning, glove on left hand), Fenn (Threadless, ~12, dog), Veil (Cantor, Fervor, rhythm-fights, hunts player because she's RIGHT), Sallow (Rue, half-Thin, memory jars, holds Layer 2), Lamplighter (ash-consumer, state-sanctioned), Ossian (master-thread anchor, rationed lucidity), Grower Ossa (Vim, sketch only).
- **Combat frame:** the Shallows; flame avatar; STRIKE/REACH/ITEM/STILL; Tempest gates STILL; kill and consume are separate acts; Weight/Warmth are independent axes.
- **Route landmarks:** first ash offered = Bell. Hunger route point-of-no-return = Fenn in the road. True-ending gates = zero consumption + master arcs + the Ward's name (sung by Veil).
- **Bell encounter (`design/encounters/bell.md`):** player has NO schools during the fight — Hush and the Hush-tap tutorial are its reward, post-fight only. Positional mercy: Tempest falls only in the Gate zone (top third); Hearth-zone shelter raises it. Softening: her patterns thin when player Wick ≤ 5, and it costs mercy progress. "Ring the bell" verb + one silent dodge phase gate the STILL. Four outcomes: `stilled` / `stilled_scarred` (mercy after her Vim-crack; she flinches at fast movement forever after) / `guttered` / tucked-in (repeatable fail-state, `tucked_in_count` caps at 5). Starting wrought weapon: the trimming hook (lantern orchards). Fenn witnesses the outcome from the orchard wall.

## Open decisions (owner: user; flag me when deciding)
| # | Decision | Leading candidate | Needed by |
|---|---|---|---|
| 1 | Final title | CAULBORN | Marketing, whenever |
| 2 | What's outside the Caul now | War long over; quarantine unmanned; door unlocked for a century | End of Ch.3 writing |
| 3 | Meta/fourth-wall depth beyond the Guest (file saves, resets acknowledged?) | Diegetic-only (Ward loops), no file manipulation | Before Ch.6 |
| 4 | The Ward's lost name — what it is, where found | Undecided; candidates involve the Founders' erasure records (Archive) + the Quiet | Ch.6 writing |
| 5 | True-ending sacrifice | Player loses the loops (death becomes real) — vs. way home, vs. their magic | Ch.7 |
| 6 | Bell's Thinning resolution in true ending (rule: nothing heals Thin — break it at a price, or honor it?) | Honor the rule; her ending is a good snuffing, not a cure | Ch.7 |
| 7 | The Guest's debt in the true ending | Undecided — release, embodiment, or refusal all live | Ch.7 |
| 8 | Grower Ossa & the Verdance's secret (seed-stock origin) | Undecided | Ch.4 |
| 9 | Engine | **RESOLVED 2026-07-03: Godot 4.x, standard build (GDScript), latest stable** | — |

## Contradiction watch-list (traps we've set for ourselves)
- The player's casting doesn't Fray → the Mendery's meters read them as null. Any scene where the Mendery *detects the player's magic* via metering is a bug. They can detect effects, witnesses, stance-sense — not Fray.
- Wards stop magic, not matter → any Hush shield stopping an arrow/knife is a bug. Keeps Threadless and wrought weapons relevant; also means Bell cannot shield anyone from mundane violence (relevant on violence route).
- The Guest cannot gutter and leaves no ash → no design may ever offer the Guest as a consumable or killable target.
- Nobody living has seen the Ward → all imagery of it before Ch.7 must be dream-derived, scriptural (wrong), or the Guest's (secondhand, agenda-filtered).
- Sallow's memory: anything Sallow "remembers" on-screen must exist in a jar or be post-jarring knowledge. Track what's in jars per chapter once Ch.3 is scripted.
- Fenn is Threadless: he can NEVER cast, on any route, under any circumstance, including "just this once." His arc dies the moment he does. Contraptions and Caul-touching only.
- Rhythm = Fervor telegraphs for Cantors only. If a non-Cantor fight syncs bullets to music, it needs its own justification.
- The Ward loves the player from the first fall — its dream-weather must track the player's Weight from Ch.1 onward, retroactively checked each chapter.
- No defensive casting exists before Bell's resolution → any Ch.1 tutorial, item text, or dialogue referencing Hush-tap (or any school) pre-boss is a bug.
- Bell's bell-chime telegraphs are diegetic object SFX, not score-sync — the Cantor exclusivity rule stands.
- If `stilled_scarred`, no later scene may play Bell's mercy as fully clean — her flinch is permanent and never remarked on in dialogue.

## Session log
- **2026-07-03:** Founding session. Tone (darker fantasy), setting (sealed world), protagonist (silent vessel), scope (bible + Ch.1 slice) locked with user. Docs 00–05 drafted. All names/personalities above are DRAFT until user sign-off — nothing player-facing is final.
- **2026-07-03 (later):** User reviewed the bible and approved it — draft names, personalities, and structure above are now working canon; future changes are retcons and must be logged here. Project workflow skill created at `.claude/skills/undertale-style-game-dev/SKILL.md` (refined from user's root SKILL.md, which was removed to avoid drift).
- **2026-07-03 (later still):** Bell boss encounter fully specced (`design/encounters/bell.md`) at user's request. New canon promoted above (Bell encounter block); three watch-list entries added. Tuning numbers provisional pending slice playtests.
- **2026-07-03 (engine):** User chose Godot — decision #9 resolved (Godot 4.x standard/GDScript). Project skeleton created: `project.godot` (320×240, viewport stretch, nearest filtering), `game/main.tscn`, `game/autoload/game_state.gd` (Warmth/Weight/flags), `.gitignore`, `README.md`, `design/06-implementation-plan.md` (milestones M0–M10, Bell-first battle engine). Godot not yet installed on user's machine — M0 pending.
- **2026-07-03 (M0 ✓, M1 code delivered):** User installed Godot 4.7 and ran the skeleton. M1 written: `game/battle/` — BattleBox (zone-aware: gate/mid/hearth thirds), Bullet, FlamePlayer (Wick 20, 1s i-frames, polled overlap damage), BulletPattern base + HushPattern school base (DRIFT 28 px/s) + LullabyLattice (2.4s bars, cradle-rocking gap, deterministic). `main.gd` is a throwaway M1 harness with debug HUD; death shows "The Ward refuses this ending." and reloads. M1 acceptance pending user playtest.
- **2026-07-03 (M1 ✓, M2 code delivered):** User confirmed M1 runs. M2 written: EncounterDef/EncounterPhaseDef resources (encounters-as-data), EncounterRunner state machine (MENU→STRIKE/REACH/ITEM/STILL→DODGE loop, timed strike bar 8–16 dmg, submenu system), Inputs autoload (arrows+WASD, Z/Enter confirm, X/Shift cancel — registered in code, project.godot stays editor-owned), MothDrift pattern (lantern-moth teaser), GameState inventory (3× Orchard Preserves). Dummy encounter: TRAINING ECHO (30 HP, 2 phases) — grows into the Ch.1 tutorial echo. STILL cannot succeed and REACH is flavor-only until M3 (Tempest). M2 acceptance pending user playtest.
