class_name FlamePlayer extends Area2D
## The player's dream-presence: a small white flame (design/05-combat.md).
## Moves with the ui_* actions (arrow keys), clamped to its BattleBox.
## Damage uses polled overlap (not area_entered) so bullets still sitting on
## the flame when i-frames end will hit again.

signal wick_changed(current: int, max_value: int)
signal zone_changed(zone: String)
signal died

@export var speed := 85.0

var wick := 0
var box: BattleBox
var _iframes := 0.0
var _zone := ""

func _ready() -> void:
	wick = GameState.wick_max
	var cs := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = 2.0
	cs.shape = circle
	add_child(cs)

func _physics_process(delta: float) -> void:
	var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	position = box.clamp_local(position + dir * speed * delta)
	var z := box.zone_of(position)
	if z != _zone:
		_zone = z
		zone_changed.emit(z)
	if _iframes <= 0.0:
		for a in get_overlapping_areas():
			if a is Bullet:
				take_hit((a as Bullet).damage)
				break

func _process(delta: float) -> void:
	if _iframes > 0.0:
		_iframes -= delta
		modulate.a = 0.3 if fmod(_iframes, 0.2) < 0.1 else 1.0
	else:
		modulate.a = 1.0

func heal(amount: int) -> void:
	wick = mini(wick + amount, GameState.wick_max)
	wick_changed.emit(wick, GameState.wick_max)

func take_hit(dmg: int) -> void:
	if _iframes > 0.0 or wick <= 0:
		return
	wick = maxi(wick - dmg, 0)
	_iframes = 1.0
	wick_changed.emit(wick, GameState.wick_max)
	if wick == 0:
		set_physics_process(false)
		died.emit()

func _draw() -> void:
	draw_circle(Vector2.ZERO, 5.0, Color(1, 1, 1, 0.12))
	draw_circle(Vector2(0, 0.5), 2.5, Color.WHITE)
	draw_circle(Vector2(0, -2.5), 1.3, Color.WHITE)
