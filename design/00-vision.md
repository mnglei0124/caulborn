# CAULBORN — Vision Document
*(Working title. Alternatives on the table: THE LUMEN, WARDLIGHT, THIN.)*

## One-line pitch
A child from the outside falls into a sealed world that runs on borrowed magic — and every spell ever cast has been drawn from the pain of the imprisoned being the world was built to contain.

## Elevator pitch
CAULBORN is a 2D pixel-art RPG in the spirit of Undertale: turn-based encounters with real-time bullet-hell dodging, where every fight is a conversation and mercy is a mechanic. Unlike Undertale, the register is darker fantasy — tragedy-forward, humor as relief — and the core system is **magic as debt**: all magic is siphoned from a sealed, dreaming entity called the Ward, and the civilization inside the seal knows, dimly, that it is spending down the only thing keeping it alive. The player, the first outsider to fall in for centuries, is either the miracle the world has waited for or the beginning of its end — and which one is entirely up to how they play.

## Design pillars
1. **Combat is characterization.** Every bullet pattern is authored from a specific character's school of magic and current emotional state. No generic encounters. If a gentle character fights you, the fight *feels* like being loved by someone terrified of losing you.
2. **Mercy has a cost, and so does power.** The morality system is not good/evil points. Violence (Weight) makes you strong and the world afraid; kindness (Warmth) makes the world open and lend you its strength. Neither is free. The deepest lore reveal is that mercy is literally the origin of magic.
3. **The world remembers.** Choices persist across the run and across the story's arcs. NPCs react to your Weight, your kills, your kindnesses, your name. Continuity is a feature, not overhead.
4. **Tragedy earned, not inflicted.** Darker fantasy means deaths matter and the good ending costs something — never shock-value cruelty. Humor exists and is load-bearing: it's how these people survive living under the Lid.
5. **Massive on paper, shippable in slices.** The full multi-arc bible exists from day one. Production targets Chapter 1 (the Fallows) as a complete, polished, self-contained vertical slice — Deltarune model.

## Tone calibration
- **Register:** Darker fantasy. Character deaths are permanent within a route. The true ending requires sacrifice.
- **Humor:** Gallows-warm. People in the Lumen joke the way hospice workers joke — because the alternative is screaming. Fenn's fireworks-magic is funny *and* heartbreaking.
- **Horror:** Existential and quiet, not gore. The scariest things are the Thin (people fading out of existence from casting too much) and the late-game reveal about the seal.
- **What we never do:** cruelty as spectacle, misery without meaning, edginess that punishes the player for caring.

## Player fantasy
- Pacifist-leaning: *I can save these people — even the ones hunting me — if I understand them.*
- Violent: *I can take this world's power for myself, and the game will not flinch from showing me what that makes me.*
- True ending: *I can heal the wound at the bottom of the world, but not alone and not for free.*

## Scope plan
| Phase | Content | Status |
|---|---|---|
| Bible | Full lore, cast, magic, regions, combat systems (these docs) | **Now** |
| Vertical slice | Chapter 1: The Fallows. ~2–3h. Full mechanics, 1 boss (Matron Bell), Fenn arc start, all three route-tones playable | Next |
| Chapters 2–7 | One region each, built serially, reusing systems | Later |

## Art direction (brief — full doc comes with implementation phase)
- Perpetual twilight palette: teals, violets, dim ambers. No sky — the glowing membrane of the Caul is the "sky."
- **Desaturation is a mechanic.** The Thin are literally desaturated sprites. Heavy casters fade. A high-Weight player's world dims.
- Undertale-adjacent resolution (320×240 logical, integer-scaled) keeps asset costs survivable for a multi-arc game.
- Battle scenes shift into the Shallows (the Ward's dream-edge): darker, abstract, character-expressive backdrops.

## Open decisions (tracked in CONTINUITY.md)
- Final title.
- What is actually outside the Caul (leading candidate boxed in 01-world-lore).
- Whether death-loops are ever acknowledged meta-textually beyond the Guest (Undertale-style fourth-wall play: yes/no/how much).
- Engine (user will specify).
