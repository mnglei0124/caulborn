class_name EncounterDef extends Resource
## Data definition of an encounter (design/06-implementation-plan.md):
## encounters are data, not code. The runner consumes one of these.
## M2 scope: name, HP, verbs, phase list. M3 adds Tempest rules and
## per-verb effects; M4 adds emotional-state phase triggers.

@export var enemy_name := ""
@export var enemy_wick := 30
@export var reach_verbs: Array[String] = []
@export var phases: Array[EncounterPhaseDef] = []
