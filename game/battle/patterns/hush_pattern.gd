class_name HushPattern extends BulletPattern
## Hush grammar (design/02-magic-system.md): slow, dense, geometric,
## inevitable. Hush bullets never rush and never surprise — danger comes from
## coverage and patience, not speed. Keep all Hush speeds near DRIFT.

const DRIFT := 28.0
const BAR_SPACING := 8.0

## Spawns a horizontal bar of bullets across the box width with one gap,
## moving vertically at `speed` (positive = downward = herding).
func spawn_bar(y: float, gap_center_x: float, gap_width: float, speed: float = DRIFT) -> void:
	var half_w := box.size.x / 2.0
	var x := -half_w + BAR_SPACING / 2.0
	while x < half_w:
		if absf(x - gap_center_x) > gap_width / 2.0:
			spawn_bullet(Vector2(x, y), Vector2(0.0, speed))
		x += BAR_SPACING
