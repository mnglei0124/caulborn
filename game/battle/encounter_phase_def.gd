class_name EncounterPhaseDef extends Resource
## One turn-cycle of an encounter: the flavor line at the menu, what the
## enemy says, and which pattern runs for how long during the dodge.

@export var flavor := ""
@export var enemy_line := ""
@export var pattern_script: GDScript
@export var dodge_duration := 8.0
