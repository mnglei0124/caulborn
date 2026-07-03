extends Node
## Global run state: morality axes, story flags, route accounting.
## Canon: design/05-combat.md (stats), design/CONTINUITY.md (flag names).
## Weight is never shown to the player as a number — it surfaces only through
## world reactions (palette dimming, NPC lines, enemy behavior).

signal warmth_changed(new_value: int)
signal weight_changed(new_value: int)
signal flag_set(flag: String, value: Variant)

var warmth: int = 0
var weight: int = 0
var wick_max: int = 20
var breath_max: int = 10

## Run inventory. Starting kit per design/encounters/bell.md tuning targets.
var items: Array[Dictionary] = [
	{"name": "Orchard Preserves", "heal": 8},
	{"name": "Orchard Preserves", "heal": 8},
	{"name": "Orchard Preserves", "heal": 8},
]

## Story flags, namespaced by region, e.g.:
##   "fallows.bell.outcome" -> "stilled" | "stilled_scarred" | "guttered"
##   "fallows.bell.ash_consumed" -> bool
##   "fallows.bell.tucked_in_count" -> int (caps at 5)
var flags: Dictionary = {}

func set_flag(flag: String, value: Variant) -> void:
	flags[flag] = value
	flag_set.emit(flag, value)

func get_flag(flag: String, default: Variant = null) -> Variant:
	return flags.get(flag, default)

func add_warmth(amount: int) -> void:
	warmth += amount
	warmth_changed.emit(warmth)

func add_weight(amount: int) -> void:
	weight += amount
	weight_changed.emit(weight)
