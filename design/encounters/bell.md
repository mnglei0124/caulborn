# Encounter Spec — Matron Bell (Chapter 1 Boss)

Canon sources: `03-cast.md` (Bell), `05-combat.md` (frame, stats, Ch.1 roster), `02-magic-system.md` (Hush grammar, acquisition map), `CONTINUITY.md` (watch-list). Everything here is consistent with those or explicitly promoted to canon at the bottom.

## Identity & stakes
- **Where:** the Vigil's front garden, at dim. Behind the player: the Vigil's lit doorway. Beyond Bell: the gate and the Lampway to Wicktown. She stands between the child and the road.
- **Why:** the Cantors are already asking questions in Wicktown. Bell knows what the Mendery does with proof of a wound. Her solution is simple: the child never leaves. This is not a metaphor — she has a room made up.
- **The argument (want vs. need):** she *wants* to keep you; she *needs* to learn to let someone leave before the bell rings for them. The fight is that argument, conducted in Hush.
- **Critical constraint:** the player has **no schools yet** — Hush is this fight's *reward*. No defensive casting exists here. The player's whole toolkit: dodging, REACH verbs, ITEMs, and (if they choose) STRIKE with the trimming hook (starting wrought weapon, from the lantern orchards).

## The core mechanic — positional mercy
The box is oriented: **Bell and the gate at the top, the Vigil's doorway glow at the bottom.** Her Hush lattices constantly *herd downward* — push, pressure, and denser coverage up top. The bottom third (the **Hearth zone**) is visibly safer, warm-lit, almost bullet-free.

The mercy path is spatial: **her Tempest only falls while the player weathers dodge phases in the top third (the Gate zone)** — standing in the hard place, close to her, facing the road. Key drivers:

| Player behavior | Effect on Tempest |
|---|---|
| Clean dodging in the Gate zone | Falls (she sees you can survive) |
| Dodging in the middle | Neutral |
| Sheltering in the Hearth zone | Slowly RISES (you're proving her right) |
| Taking hits | Rises — and see *softening*, below |
| STRIKE | Jumps; changes the fight's tone permanently (see kill path) |

**Softening (her tell):** if the player's Wick drops to 5 or less, Bell *cannot help herself* — her patterns thin out, slow down, drift wide. This is not kindness the player should want: every softening resets her Tempest progress upward ("You see? You see what almost happened?"). Healing up re-hardens her patterns. The fight literally cannot be won by being pitiable — the player must be *worth believing in*.

**The pace:** Hush grammar per 02 — slow, dense, geometric, inevitable. Nothing in this fight is fast. Everything in this fight is *coming anyway*. Target feel: chess against an incoming tide.

## Resolutions (four)
1. **Stilled (true mercy):** endure the full spine below, ring the bell (P8), STILL. She walks you to the gate herself and teaches you Hush — the stillness she fought you with. Warmth milestone; true-ending gate opens.
2. **Stilled, scarred:** mercy achieved *after* striking her into the Vim-crack. Possible but harder (raised Tempest floor, +2 endurance phases). She still walks you to the gate. She flinches, once, when you move fast. The game never mentions it again. Flag differs (see below) and downstream dialogue is quieter.
3. **Guttered (the kill):** her HP to 0. She leaves ash — the first the game ever offers — beside the hand-bell. Consuming it grants taken-Hush and the game's first large Weight.
4. **Tucked in (fail-state-as-characterization):** if the player passively camps the Hearth zone for 3 consecutive dodge phases (or selects the "…go inside" menu option that appears from P4 on), fade to white — wake in the made-up room, `tucked_in_count +1`. Not a game over; the fight re-triggers next dim with variant dialogue. She isn't smug about it. She's *relieved*, which is worse. The Guest's candle commentary escalates through count 5, then caps with: "The last one who stayed— …no. Never mind."

Player death (Wick 0) is the standard candle-loop; the Guest's line here: "She'd be heartbroken. Fortunately, that's my job to know and yours to prevent."

## Mercy spine — 9 phases
Each phase = one menu turn + one dodge phase (8–12s, boss-length). Dialogue lines below are voice anchors, not final script.

- **P1 — Composure.** *"Supper is at the ringing. Wash your hands."* Baseline **Lullaby Lattice**: horizontal bars descending slowly, gaps offset — readable, herding downward. Teaches the zone mechanic wordlessly (surviving up top is plainly possible, plainly harder).
- **P2 — The reasonable case.** *"The road eats children. I have rung for enough of them."* Adds **Bellwave**: concentric slow rings from her hand-bell, rotating gaps. The bell's chime is the telegraph — a diegetic object cue, NOT music-sync (Cantor exclusivity preserved, see watch-list).
- **P3 — The specific case.** *"There is a woman in Wicktown who sings. You will not like her questions."* (Veil foreshadow.) Adds **Candle Count**: small flames drift up from the bottom; they gutter harmlessly if the player holds still 0.7s in their radius. Teaches the Hush lesson early: *sometimes stillness is the dodge.*
- **P4 — The first push.** **Blanket**: a slow wall descends from the top with one moving fold-gap; it does no damage — it *pushes* toward the Hearth zone. Getting shoved fully down triggers her gentlest, most dangerous line: *"There. That wasn't so hard."* The "…go inside" option appears in the menu from now on, permanently, one slot below STILL.
- **P5 — High water.** Her composure at maximum: densest Lullaby+Bellwave overlay of the fight. Pure Gate-zone endurance check. No new dialogue — she has said her piece, and the silence is doing the arguing.
- **P6 — The glove.** REACH verb **"Ask about her glove"** unlocks (always available from P6; guaranteed surfacing if the player was hit in P5). She deflects — *"Garden hands. Mind your own."* — but the lattice stutters, one visible gap out of rhythm. `bell_glove_seen = true`. Prerequisite for P8.
- **P7 — The fray.** Her calm cracks — not into another school (no strike has landed), but into honesty. **Ward's Weather**: her lattices develop irregularities, dream-sparks, gaps that open and close off-pattern. *"Everyone goes through that gate. They come back as names. I ring for the names. That bell is the heaviest thing in this house."*
- **P8 — The bell.** REACH verb **"Ring the bell"** unlocks (requires: `bell_glove_seen` + a Gate-zone-weathered P7). The player rings her own snuffing-bell — at themselves. The meaning lands without narration: *keeping me here is its own kind of snuffing; you'd be tucking a dying thing into bed.* Then the fight's hardest beat: **one full dodge phase of nothing.** No bullets. No dialogue. The player must simply stand in the Gate zone and wait it out — stillness as the final answer, the fight's thesis made playable. Moving to the Hearth zone during the silence returns to P7.
- **P9 — Still.** STILL unlocks and succeeds. She crosses the box — first time she moves from her mark — takes the player's face in both hands, gloved and bare. *"You will eat before you go. That is not a request."* Cut to the gate: she teaches Hush (gifted acquisition per 02), and the Hush-tap tutorial happens HERE, after the fight, never before. Final line at the gate, already turning back to the Vigil: *"I don't ring for the ones who come back. Give me the chance."*

## Kill path — divergence
- **Strike 1–2:** she holds Hush, but the herding stops being gentle — lattices now *cage* rather than shepherd. *"So the road's already in you. I've nursed that too."* Tempest jumps; mercy remains fully recoverable.
- **Strike 3 / HP < 50% — the Vim crack:** her stance breaks, per canon, into Vim — she grows the Vigil's garden into the box. **Rootbind**: vines enter from the box edges and persist and thicken across turns (Vim grammar: the arena is the pressure), lunging to hold the flame in place. **Garden**: blooms burst where lattice bars land. *"Stay. STAY. I have buried EVERYONE—"* From here, mercy is still possible but **scarred**: Tempest floor raised, +2 endurance phases, and P8's silence must be survived with Rootbind still live in the box.
- **Final phase (HP < 15%):** all patterns stop. She pulls off the glove and shows the translucent hand — the Thinning, named for the first time in the game by nobody, because neither of them says anything. *"I was leaving soon anyway. But not like this. Please — not like this."* One more Strike ends it. She gutters. The ash settles beside the hand-bell, and the CONSUME prompt appears — deliberately, on its own menu screen, with all the time in the world. Nothing forces the choice. That's the point.
- Numbers: Bell Wick **60**; trimming-hook timed Strike **12 ± 4** → ~5 strikes. Kill path ~5 phases, mercy path 9–11: the mercy fight is the longer, harder, richer one, as 05 requires.

## Reach verbs (full table)
| Verb | Available | Effect |
|---|---|---|
| Talk | P1+ | Cycles her case: the road, the Cantors, supper. Small Tempest drop first use per phase |
| Promise to return | P2+ | Tempest RISES: *"They all say that. I have a drawer of those."* (Trap verb — teaches that comfort ≠ mercy) |
| Ask her to come along | P3+ | *"And who rings, then?"* Neutral; unlocks Vigil-resident epilogue lines |
| Ask about her glove | P6+ | Required for P8. `bell_glove_seen` |
| Ring the bell | P8, gated | Opens the silence phase → STILL |
| …go inside | P4+, bottom of menu | Tucked-in resolution |

## Tuning targets (provisional, playtest to confirm)
Player: Wick 20, no Breath usage (no schools), items: 3× orchard preserves (heal 8). Bell's bullets: **3 damage** flat. Dodge phases 8–12s. Softening threshold: player Wick ≤ 5. Hearth-camp fail: 3 consecutive full phases. Target first-clear (mercy): 3–5 attempts for an average player; the fight should feel *just* past comfortable, never random — every death readable in hindsight.

## Flags set & downstream reactions
- `fallows.bell.outcome` ∈ `stilled | stilled_scarred | guttered` — referenced by: Fenn (immediately — he was watching from the orchard wall), Vigil residents' epilogues, the Guest's next three candles, Veil in Ch.5 (*"The Hush-matron of the rim speaks of you"* / a silence where that line would be), true-ending gate.
- `bell_ash_consumed` (bool) — Hunger-route accounting begins here; world dimming step 1.
- `tucked_in_count` (int, caps at 5), `bell_glove_seen` (bool).

## Asset & audio checklist (for slice production)
- Sprites: Bell battle-idle (glacial sway), cast pose (bell-hand raised), softening tell (shoulders drop), Vim-crack pose, glove-off (2 frames, hold long), gate farewell overworld set.
- Patterns: Lullaby Lattice, Bellwave, Candle Count, Blanket, Ward's Weather modifiers, Rootbind, Garden. All slow; readability at 320×240 is the constraint that matters.
- Audio: her theme is a lullaby arrangement of the Vigil's ambient theme; **no bullet-to-music sync** — the hand-bell chime SFX is the only audio telegraph. P8's silence phase: full music stop, room tone only. That silence is the most expensive-feeling audio cue in the chapter and costs nothing.

## Continuity notes (checks performed against the ledger)
1. Hush stops magic, not matter — respected: nothing in this fight blocks the player's trimming hook; her only answers to being struck are herding, cracking, and pleading.
2. Rhythm-sync is Cantor-only — respected: Bellwave telegraphs are diegetic chimes, not score-synced.
3. Nothing heals Thin — respected: her hand stays translucent in every resolution.
4. First-ash rule — respected: this is the game's first CONSUME offer, staged deliberately.
5. NEW CANON promoted to the ledger this session: player has no schools during this fight (Hush-tap tutorial is post-fight only); positional mercy (Gate/Hearth zones); the softening behavior; "Ring the bell" verb; trimming hook as starting weapon; the four-outcome structure incl. `stilled_scarred` and `tucked_in_count`.
