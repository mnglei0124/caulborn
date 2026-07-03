class_name Bullet extends Area2D
## A single bullet. Spawned and configured by BulletPattern.spawn_bullet();
## never instanced directly by encounters.

var velocity := Vector2.ZERO
var radius := 3.0
var damage := 3
var despawn_rect := Rect2(-1000, -1000, 2000, 2000)

func _ready() -> void:
	var cs := CollisionShape2D.new()
	var circle := CircleShape2D.new()
	circle.radius = radius
	cs.shape = circle
	add_child(cs)

func _physics_process(delta: float) -> void:
	position += velocity * delta
	if not despawn_rect.has_point(position):
		queue_free()

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color.WHITE)
