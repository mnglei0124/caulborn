class_name BulletPattern extends Node2D
## Base for all bullet patterns. Always a child of a BattleBox; all
## coordinates box-local. School subclasses (HushPattern etc.) encode the
## grammar defaults from design/02-magic-system.md; named patterns subclass
## those. Encounters run patterns — they never spawn bullets themselves.

signal finished

var box: BattleBox
var running := false

func start(in_box: BattleBox) -> void:
	box = in_box
	running = true
	_run()

func stop() -> void:
	running = false
	for c in get_children():
		c.queue_free()

func spawn_bullet(pos: Vector2, velocity: Vector2, radius: float = 3.0, damage: int = 3) -> Bullet:
	var b := Bullet.new()
	b.position = pos
	b.velocity = velocity
	b.radius = radius
	b.damage = damage
	b.despawn_rect = box.rect().grow(24.0)
	add_child(b)
	return b

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

## Override in subclasses. May be async (use `await wait(...)`); must check
## `running` after every await and bail out if false.
func _run() -> void:
	pass
