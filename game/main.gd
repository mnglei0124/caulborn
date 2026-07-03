extends Node2D
## M2 harness: feeds the runner a dummy encounter — a training echo, which
## will grow into the Ch.1 tutorial echo (design/05-combat.md roster #1).
## Encounters are data (EncounterDef); this builds one in code. Later they
## move to .tres files in data/encounters/.

func _ready() -> void:
	var runner := EncounterRunner.new()
	add_child(runner)
	runner.run(_training_echo())

func _training_echo() -> EncounterDef:
	var def := EncounterDef.new()
	def.enemy_name = "TRAINING ECHO"
	def.enemy_wick = 30
	def.reach_verbs.assign(["Listen", "Hum along", "Hold still"])

	var p1 := EncounterPhaseDef.new()
	p1.flavor = "The echo hums a half-remembered lullaby."
	p1.enemy_line = "...hush now..."
	p1.pattern_script = preload("res://game/battle/patterns/lullaby_lattice.gd")
	p1.dodge_duration = 7.0

	var p2 := EncounterPhaseDef.new()
	p2.flavor = "Dream-moths spill from the echo's edges."
	p2.enemy_line = "...the lanterns, the lanterns..."
	p2.pattern_script = preload("res://game/battle/patterns/moth_drift.gd")
	p2.dodge_duration = 7.0

	def.phases.assign([p1, p2])
	return def
