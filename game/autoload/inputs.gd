extends Node
## Registers gameplay input actions in code so project.godot stays
## editor-owned. Arrows + WASD move; Z/Enter confirm; X/Shift cancel
## (Undertale-familiar bindings).

const ACTIONS := {
	"move_left": [KEY_LEFT, KEY_A],
	"move_right": [KEY_RIGHT, KEY_D],
	"move_up": [KEY_UP, KEY_W],
	"move_down": [KEY_DOWN, KEY_S],
	"confirm": [KEY_Z, KEY_ENTER],
	"cancel": [KEY_X, KEY_SHIFT],
}

func _ready() -> void:
	for action: String in ACTIONS:
		if not InputMap.has_action(action):
			InputMap.add_action(action)
		for key: Key in ACTIONS[action]:
			var ev := InputEventKey.new()
			ev.physical_keycode = key
			InputMap.action_add_event(action, ev)
