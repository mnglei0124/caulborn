# Combat Design — Encounters, Patterns, Morality

## Frame
Encounters pull the player a step into **the Shallows** — the edge of the Ward's dream. This justifies the abstraction (bullet-box, expressive backdrops) diegetically: fights happen where feelings have shapes. The player's dream-presence in the box is a small white **flame** (readable at tiny sizes; gutters and dims with damage; visual language shared with candles, snuffings, and the Thin).

Turn loop (Undertale-familiar, deliberately):
1. **Player menu:** STRIKE / REACH / ITEM / STILL
2. **Enemy turn:** real-time dodge phase in the box (the bullet-hell beat)
3. Repeat until: Stilled (mercy), guttered (kill), fled (theirs or yours), or scripted resolution.

- **STRIKE:** timing-bar attack with wrought weapon, or an offensive cast (school spell) chosen from a sub-menu.
- **REACH:** the ACT-equivalent — reach into the dream toward them. Verbs are per-enemy and grow with learned schools (soothe/rile/mourn/tend/riddle = Hush/Fervor/Rue/Vim/Wit flavored options). Reaching reveals and reduces **Tempest**.
- **STILL:** spare. Available anytime; *succeeds* when Tempest is low enough. Stilling a becalmed enemy ends the fight in mercy.
- **ITEM:** consumables + wrought tools (the Threadless-accessible layer; Fenn's contributions live here).

## Stats (small integers, Undertale-scale readability)
| Stat | Is | Notes |
|---|---|---|
| **Wick** | HP | Flame gutters at 0 → the Ward refuses the ending → wake at last candle (diegetic death-loop; the Guest keeps count) |
| **Breath** | Cast resource | Spent on spells in menu phase AND during dodge phases (see defensive casting). Partially regenerates each turn |
| **Weight** | Violence track | Grows with kills (a little) and ash consumption (a lot). Never shown as a number — shown as the world's reaction: dimming palettes, NPC flinches, "you seem heavier," enemy behavior shifts |
| **Warmth** | Mercy track | Grows via Stilling, arcs completed, kindnesses. Buys: NPC battle-aid, cheaper gifted casts, dream-gifts, true-ending gates |
| **Tempest** | Per-enemy agitation | The Still-gate. Reduced by correct Reach verbs, raised by Strikes and wrong verbs. Visible as the enemy sprite's weather |
| Gear | Wrought weapon + trinket | Flat small modifiers; story items double as gear (Undertale tradition honored) |

Weight and Warmth are independent axes, not a slider — a player can be both feared and loved, and several neutral endings live in that overlap.

## Defensive casting (the skill-expression layer Undertale lacks)
During dodge phases the player may spend Breath on quick casts: **Hush-tap** (brief slow-field / micro-shield), **Wit-step** (short translocation), later others. Costs are tuned so casting every wave is impossible — it's a panic button and a mastery expression, not a dodge replacement. Mercy runs get the deepest defensive toolkit (gifted magic is protective by nature), which makes the pacifist path the high-skill-ceiling path *mechanically*, matching its narrative demand.

## Bullet-pattern language
Every encounter's patterns are generated from three authored inputs — never generic:

**1. School grammar** (the vocabulary — see 02-magic-system table):
- *Hush:* slow dense lattices; safe-zone reading; patience checks. Danger is inevitability, not speed.
- *Fervor:* aimed shots, bursts, beams; rhythm-synced for Cantors (the music telegraphs — audio IS the attack pattern).
- *Rue:* homing memories; **echo bullets that replay the player's own movement path from N seconds ago** (your past self chases you — signature mechanic, mechanically grief); delayed blooms.
- *Vim:* growth that persists across turns — vines/blooms that stay in the box and spread each round; the arena itself is the enemy's health-adjacent pressure.
- *Wit:* rule-breaks — control inversion, feints, false telegraphs, fake UI elements, patterns that lie once and teach paranoia. Used sparingly; every Wit fight is a set-piece.

**2. Personality** (the accent): the same school speaks differently per character. Bell's Hush herds you gently toward the door; a Mendery gate-guard's Hush walls you off cold. Fenn's "patterns" are contraptions — bottle rockets with Fervor's grammar and none of its magic, misfiring in character.

**3. Emotional state** (the live phase system): stance = school, so **when a character's emotional state breaks mid-fight, their pattern language shifts** — the system-level storytelling device:
- Veil's crisis fight: hymn-synced Fervor collapses mid-battle into unsynced, arrhythmic Rue. The player *feels* her faith break through the dodge phase before any dialogue says it.
- Bell pushed to desperation on a violence route: Hush cracks into Vim — she grows the Vigil's garden into the box, trying to root you in place.
- Phase triggers: HP thresholds, specific Reach verbs, story flags, player Weight.

**4. Player-reactive modifier:** high Weight makes ordinary enemies fight *frightened* — faster, sloppier, desperate patterns, more flee attempts (killing becomes easier and uglier); high Warmth unlocks mid-fight NPC interventions in later chapters. Every fight reflects the enemy's personality AND the player's reputation.

## Kill / consume / spare — the morality mechanics
- **Stilling** (Tempest → low, then STILL): full mercy. Warmth. Enemies remember, regions warm to you.
- **Fleeing enemies:** a becalmed *or* terrified enemy may flee — a neutral outcome Undertale mostly lacks. No Warmth, minimal Weight; the world tracks "driven off" separately.
- **Guttering** (Wick → 0): the kill. Small Weight. The enemy leaves **ash**.
- **Consuming ash:** a separate, deliberate menu action over the remains. Large Weight; grants/upgrades taken magic (see 02). The game's most important button: killing can be desperation; consuming is appetite. First offered over Matron Bell.
- **Route thresholds (working):** true-ending gate = zero consumed ash + Warmth milestones with all masters + the name-quest. The Hunger route (genocide-equivalent) = consuming every master's ash; it is opt-in-by-pattern, announced by the world's dimming, and its point of no return is Fenn in the road.

## Endings matrix (outline — full doc when Ch.7 is written)
- **True ending — "The Unsealing":** all masters' arcs + no consumption + the Ward's name found and sung (Veil). The Founders' choice re-enacted: the player must give up something permanent (leading candidate: their way home / their loops — the Ward stops catching them; death becomes real in the epilogue). The Caul opens. What's outside pays off the boxed decision in 01-world-lore. Bell's Thinning and the Guest's debt must both be answered here — unresolved design, flagged.
- **The Hunger ending:** all ash consumed → the player eats the Ward and steps out as the new Sundering. The next world's mercy problem. The Guest's final scene here is the route's last horror (what do they do with a hollowed door?).
- **Neutral endings (matrix):** keyed to which masters live × Weight/Warmth overlap × Fenn's status. Undertale-style epilogue phone-call equivalent: the Guest talks to you at the last candle, and what they know about the people you left behind IS the epilogue. Draft ~8–10 variants when Ch.7 locks.

## Encounter math (vertical-slice tuning targets)
- Player Wick: 20 at start; +2–4 per Warmth/story milestone (not per-kill — no XP-heal loop on mercy runs).
- Ordinary Fallows encounters: 2–4 turns to Still via correct Reaching; 2–3 Strikes to gutter. Enemy dodge-phase duration 6–10s.
- Bell (Ch.1 boss): ~8–10 phases mercy path (endurance of Hush lattices; zero Strikes needed), ~5 phases kill path. Mercy path must be the *harder, richer* fight.
- Damage: bullets 2–4 Wick; consumables heal 6–12; Breath pool 10, Hush-tap costs 3, regen 2/turn. All numbers provisional until slice playtests.

## Chapter 1 encounter roster (vertical slice)
1. **Tutorial echo** (scripted, unkillable): a fragment-dream the Guest walks you through at the first candle.
2. **Fallows fauna ×3:** lantern-moths (Hush-grammar, drift-lattices), root-hogs (charge lines, Fervor-adjacent, zero magic — teaches mundane danger), a grief-wisp strayed from the Sedge (Rue teaser: your first echo-bullet).
3. **Mendery gate-guard** (Hush, cold variant): teaches that the same school speaks two ways — fight him after Bell's fight and feel the difference.
4. **Fenn "ambush"** (contraptions, unloseable-ish): pure characterization, three misfire phases, dog cameo.
5. **Matron Bell** (boss): full spec above, own document when we build (`encounters/bell.md`).
