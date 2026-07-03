class_name MothDrift extends HushPattern
## Lantern-moth grammar teaser (Ch.1 fauna, design/05-combat.md roster):
## small moths drift across the box from alternating sides at varying
## heights. Hush-adjacent: unhurried, readable, everywhere at once.

@export var interval := 0.9

func _run() -> void:
	var i := 0
	while running:
		var from_left := i % 2 == 0
		var y := sin(i * 1.7) * box.size.y * 0.35
		var dir := 1.0 if from_left else -1.0
		var x := (-box.size.x / 2.0 - 8.0) if from_left else (box.size.x / 2.0 + 8.0)
		spawn_bullet(Vector2(x, y), Vector2(dir * DRIFT * 1.3, sin(i * 0.8) * 6.0), 2.5)
		i += 1
		await wait(interval)
		if not is_inside_tree():
			return
	finished.emit()
