---
name: undertale-style-game-dev
description: Design, refine, and build CAULBORN — a darker-fantasy 2D pixel-art RPG in the Undertale style with character-driven bullet-hell combat, branching morality, and a central magic system. Use whenever the user works on the game's lore, characters, magic, regions/map, combat encounters, dialogue, pixel art direction, or implementation code — even without saying "game design" (e.g. "let's talk about this boss fight," "I want a new region," "write this NPC's dialogue," "what should this spell do"). Also use to check new ideas for continuity/contradictions against established canon.
---

# CAULBORN — Game Dev Companion

Collaborative design/refine/build workflow for the game in this repo. The canon is on disk, not in chat memory.

## Canon anchor — read before inventing anything

- **`design/CONTINUITY.md` is the source of truth**: hard canon, contradiction watch-list, open-decisions table, session log. Rule: *not in the ledger or numbered docs = not canon yet.*
- Doc map: `design/00-vision.md` (pillars, tone, scope) · `01-world-lore.md` (the Lumen, Caul, Ward, three-layer history) · `02-magic-system.md` (five stance-schools, costs, hard rules) · `03-cast.md` · `04-regions.md` · `05-combat.md` (patterns, stats, morality mechanics).
- The bible was reviewed and approved by the user on 2026-07-03. Changing an established fact is a **retcon**: confirm it's deliberate, then update the ledger and session log in the same session.

## Project defaults (assume unless the user overrides)

- **Tone:** darker fantasy — tragedy-forward, humor as relief, never cruelty as spectacle. Not Undertale's comedy-forward register.
- **Combat is characterization:** every encounter's bullet patterns come from school grammar × personality × live emotional state (see 05). No generic encounters.
- **Magic is central:** every design conversation should ask whether it touches magic, and if so, check it against 02's hard rules (no stance no cast; Hush stops magic not matter; nothing heals Thin; no resurrection; kill ≠ consume).
- **Scope:** full bible on paper; production targets the Chapter 1 vertical slice (The Fallows) first.

## Which mode applies

Jump straight to the mode the request falls into — don't force a full pipeline for one piece.

### 1. Designing (new content)
- Ground in the ledger and docs before inventing; propose strong defaults and move. Ask only when a decision is hard to reverse (core magic rule, character's core motivation, ending structure) — and check the open-decisions table first; it may already name the owner and deadline.
- New characters need: a personality hook, want vs. need, a relationship web to ≥2 existing cast, their school/stance, and how their personality shows up as bullet patterns.
- New regions need: tone job, palette, the emotional beat they build toward, key NPCs, and how magic manifests locally.
- New encounters: describe pattern logic in plain language first (school grammar → personality accent → emotional phase shifts), plus the nonviolent resolution, before any code.

### 2. Refining (existing content)
- Cross-reference the ledger. Flag conflicts explicitly: "CONTINUITY.md / doc X establishes A — this conflicts because B. Retcon or oversight?"
- Protect established character voice; don't smooth it generic.
- Mechanics must still serve the emotional beat — the mechanic *is* the characterization.

### 3. Building (implementation)
- Engine: still open decision #9 — ask if not yet known; don't assume.
- Pixel art: direction only (palette, silhouette readability, frame counts) per 00-vision's art rules — twilight palette, desaturation-as-mechanic, 320×240 logical.
- Code: match existing project conventions once code exists; otherwise separate concerns — dialogue data, pattern data, and a flags/state layer for Weight/Warmth and route tracking.
- Dialogue: in-character, with explicit flag bookkeeping (what gets set, what it unlocks later).

## Magic sanity-check (for any new magic detail)

Check against the six dimensions — origin, access, school/stance, cost, character expression, player progression — remembering all six already have canon answers in `02-magic-system.md`. A new detail must fit them or be flagged as a deliberate retcon. Then check the contradiction watch-list in the ledger.

## Continuity upkeep (every session that adds canon)

- Log the session in CONTINUITY.md's session log.
- Promote newly decided facts into hard canon; resolve or update the open-decisions table.
- If a new fact sets a trap for later writing, add it to the watch-list.

## Working style

- Strong, opinionated proposals over open-ended questions; state assumptions briefly and proceed.
- Bundle genuinely blocking questions into one round — never drip-feed.
- Substantial output (a region, a character, an encounter spec) goes into the repo as a structured doc (e.g. `design/encounters/`), not just chat.
