class_name BattleBox extends Node2D
## The encounter box. Local origin = box center; everything inside (flame,
## bullets, patterns) works in box-local coordinates.
## Zones are vertical thirds — canon: Bell's Gate/Hearth positional mercy
## (design/encounters/bell.md). Gate = top (toward the enemy), Hearth = bottom.

const ZONE_GATE := "gate"
const ZONE_MID := "mid"
const ZONE_HEARTH := "hearth"

@export var size := Vector2(150, 100)

func rect() -> Rect2:
	return Rect2(-size / 2.0, size)

func clamp_local(p: Vector2, margin: float = 3.0) -> Vector2:
	var half := size / 2.0 - Vector2(margin, margin)
	return p.clamp(-half, half)

func zone_of(p: Vector2) -> String:
	if p.y < -size.y / 6.0:
		return ZONE_GATE
	if p.y > size.y / 6.0:
		return ZONE_HEARTH
	return ZONE_MID

func _draw() -> void:
	draw_rect(rect().grow(2.0), Color.WHITE, false, 2.0)
