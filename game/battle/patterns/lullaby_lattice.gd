class_name LullabyLattice extends HushPattern
## Bell's baseline pattern (design/encounters/bell.md, P1): horizontal bars
## descending slowly, herding the player toward the Hearth zone. The gap rocks
## side to side like a cradle — deterministic sinusoid, never random, because
## Hush danger is inevitability the player can read.

@export var interval := 2.4
@export var gap_width := 26.0

func _run() -> void:
	var i := 0
	while running:
		var sway := box.size.x / 2.0 - gap_width / 2.0 - 8.0
		var gap_x := sin(i * 0.9) * sway
		spawn_bar(-box.size.y / 2.0 - 8.0, gap_x, gap_width)
		i += 1
		await wait(interval)
		if not is_inside_tree():
			return
	finished.emit()
