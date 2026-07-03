class_name EncounterRunner extends Node2D
## The battle state machine (design/06-implementation-plan.md, M2):
## MENU -> action -> DODGE -> MENU ... until gutter, spare, or death.
## Consumes an EncounterDef; owns the box, flame, menus, and turn flow.
## M3 wires Tempest/verb effects and STILL success; M4 adds emotional-state
## phase triggers and the kill/consume split. STILL never succeeds yet.

enum State { INTRO, MENU, REACH_MENU, ITEM_MENU, STRIKE, WAIT, DODGE, END }

const BOX_CENTER := Vector2(160, 118)
const MENU_ACTIONS: Array[String] = ["STRIKE", "REACH", "ITEM", "STILL"]
const STRIKE_SWEEP := 1.1

var def: EncounterDef
var state := State.INTRO
var phase_index := 0
var enemy_wick := 0
var menu_index := 0
var sub_index := 0
var strike_t := 0.0

var box: BattleBox
var flame: FlamePlayer
var pattern: BulletPattern

var canvas: CanvasLayer
var enemy_label: Label
var status_label: Label
var flavor_label: Label
var enemy_line_label: Label
var popup_label: Label
var death_label: Label
var menu_labels: Array[Label] = []
var sub_labels: Array[Label] = []

func run(encounter: EncounterDef) -> void:
	def = encounter
	enemy_wick = def.enemy_wick
	_build_scene()
	_enter_menu()

func _build_scene() -> void:
	box = BattleBox.new()
	box.position = BOX_CENTER
	add_child(box)

	flame = FlamePlayer.new()
	flame.box = box
	box.add_child(flame)
	flame.hide()
	flame.set_physics_process(false)
	flame.wick_changed.connect(_update_status)
	flame.died.connect(_on_flame_died)

	canvas = CanvasLayer.new()
	add_child(canvas)

	enemy_label = _make_label(Vector2(0, 8), true)
	status_label = _make_label(Vector2(8, 178))
	flavor_label = _make_label(Vector2(94, 78))
	flavor_label.custom_minimum_size = Vector2(132, 0)
	flavor_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	enemy_line_label = _make_label(Vector2(0, 52), true)
	enemy_line_label.hide()
	popup_label = _make_label(Vector2(0, 30), true)
	popup_label.hide()
	death_label = _make_label(Vector2(0, 110), true)
	death_label.text = "The Ward refuses this ending."
	death_label.hide()

	for i in MENU_ACTIONS.size():
		var l := _make_label(Vector2(24 + i * 76, 210))
		l.text = MENU_ACTIONS[i]
		menu_labels.append(l)

	_update_enemy_label()
	_update_status(flame.wick, GameState.wick_max)

func _make_label(pos: Vector2, centered: bool = false) -> Label:
	var l := Label.new()
	l.position = pos
	l.add_theme_font_size_override("font_size", 10)
	if centered:
		l.size = Vector2(320, 14)
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	canvas.add_child(l)
	return l

func _process(delta: float) -> void:
	match state:
		State.MENU:
			_menu_input()
		State.REACH_MENU, State.ITEM_MENU:
			_submenu_input()
		State.STRIKE:
			_strike_update(delta)
		_:
			pass

# --- menu ---

func _enter_menu() -> void:
	state = State.MENU
	flavor_label.text = "* " + def.phases[phase_index].flavor
	flavor_label.show()
	for l in menu_labels:
		l.modulate.a = 1.0
	_update_menu_highlight()

func _menu_input() -> void:
	if Input.is_action_just_pressed("move_left"):
		menu_index = wrapi(menu_index - 1, 0, MENU_ACTIONS.size())
		_update_menu_highlight()
	elif Input.is_action_just_pressed("move_right"):
		menu_index = wrapi(menu_index + 1, 0, MENU_ACTIONS.size())
		_update_menu_highlight()
	elif Input.is_action_just_pressed("confirm"):
		match MENU_ACTIONS[menu_index]:
			"STRIKE":
				strike_t = 0.0
				state = State.STRIKE
			"REACH":
				_open_submenu(def.reach_verbs, State.REACH_MENU)
			"ITEM":
				if GameState.items.is_empty():
					flavor_label.text = "* Nothing left but pocket lint."
				else:
					var names: Array[String] = []
					for it in GameState.items:
						names.append(String(it.name))
					_open_submenu(names, State.ITEM_MENU)
			"STILL":
				_do_still()

func _update_menu_highlight() -> void:
	for i in menu_labels.size():
		var selected := i == menu_index
		menu_labels[i].add_theme_color_override(
			"font_color", Color.YELLOW if selected else Color.WHITE)

# --- submenus ---

func _open_submenu(options: Array[String], target_state: State) -> void:
	sub_index = 0
	for i in options.size():
		var l := _make_label(Vector2(104, 84 + i * 13))
		l.text = options[i]
		sub_labels.append(l)
	flavor_label.hide()
	state = target_state
	_update_sub_highlight()

func _clear_sub() -> void:
	for l in sub_labels:
		l.queue_free()
	sub_labels.clear()

func _update_sub_highlight() -> void:
	for i in sub_labels.size():
		var selected := i == sub_index
		sub_labels[i].add_theme_color_override(
			"font_color", Color.YELLOW if selected else Color.WHITE)

func _submenu_input() -> void:
	if Input.is_action_just_pressed("move_up"):
		sub_index = wrapi(sub_index - 1, 0, sub_labels.size())
		_update_sub_highlight()
	elif Input.is_action_just_pressed("move_down"):
		sub_index = wrapi(sub_index + 1, 0, sub_labels.size())
		_update_sub_highlight()
	elif Input.is_action_just_pressed("cancel"):
		_clear_sub()
		_enter_menu()
	elif Input.is_action_just_pressed("confirm"):
		var was_reach := state == State.REACH_MENU
		var index := sub_index
		_clear_sub()
		if was_reach:
			_do_reach(def.reach_verbs[index])
		else:
			_do_item(index)

# --- actions ---

func _do_reach(verb: String) -> void:
	# M3: verbs get per-encounter Tempest effects. For now, flavor only.
	_show_then_dodge("* You reach into the dream. %s." % verb)

func _do_item(index: int) -> void:
	var item: Dictionary = GameState.items[index]
	GameState.items.remove_at(index)
	flame.heal(int(item.heal))
	_show_then_dodge("* %s. Warmth, briefly. +%d WICK." % [item.name, int(item.heal)])

func _do_still() -> void:
	# M3: succeeds when Tempest is low enough. Never succeeds yet.
	_show_then_dodge("* You reach for stillness. The dream churns on.")

func _show_then_dodge(text: String) -> void:
	state = State.WAIT
	flavor_label.text = text
	flavor_label.show()
	await get_tree().create_timer(1.1).timeout
	if state != State.WAIT:
		return
	_begin_dodge()

# --- strike ---

func _strike_update(delta: float) -> void:
	strike_t += delta
	queue_redraw()
	if Input.is_action_just_pressed("confirm"):
		var offset := absf(strike_t / STRIKE_SWEEP * 120.0 - 60.0)
		var accuracy := clampf(1.0 - offset / 60.0, 0.0, 1.0)
		_resolve_strike(roundi(8.0 + 8.0 * accuracy))
	elif strike_t >= STRIKE_SWEEP:
		_resolve_strike(0)

func _resolve_strike(dmg: int) -> void:
	if dmg <= 0:
		_popup("MISS")
	else:
		enemy_wick = maxi(enemy_wick - dmg, 0)
		_update_enemy_label()
		_popup("-%d" % dmg)
	if enemy_wick <= 0:
		_end_gutter()
	else:
		_begin_dodge()
	queue_redraw()

func _draw() -> void:
	if state != State.STRIKE:
		return
	var bar := Rect2(BOX_CENTER.x - 60, BOX_CENTER.y - 8, 120, 16)
	draw_rect(bar, Color.WHITE, false, 1.0)
	draw_line(Vector2(BOX_CENTER.x, bar.position.y), Vector2(BOX_CENTER.x, bar.end.y), Color(1, 1, 1, 0.4))
	var cx := bar.position.x + strike_t / STRIKE_SWEEP * bar.size.x
	draw_line(Vector2(cx, bar.position.y - 2), Vector2(cx, bar.end.y + 2), Color.WHITE, 2.0)

# --- dodge ---

func _begin_dodge() -> void:
	state = State.DODGE
	flavor_label.hide()
	for l in menu_labels:
		l.modulate.a = 0.35
	var phase := def.phases[phase_index]
	if phase.enemy_line != "":
		enemy_line_label.text = phase.enemy_line
		enemy_line_label.show()
	flame.position = Vector2(0, 25)
	flame.show()
	flame.set_physics_process(true)
	pattern = phase.pattern_script.new() as BulletPattern
	box.add_child(pattern)
	pattern.start(box)
	await get_tree().create_timer(phase.dodge_duration).timeout
	if state != State.DODGE:
		return
	_end_dodge()

func _end_dodge() -> void:
	pattern.stop()
	pattern.queue_free()
	pattern = null
	flame.hide()
	flame.set_physics_process(false)
	enemy_line_label.hide()
	phase_index = (phase_index + 1) % def.phases.size()
	_enter_menu()

# --- endings ---

func _end_gutter() -> void:
	state = State.END
	flavor_label.text = "* The echo comes apart into drifting motes.\n* Something settles where it stood."
	flavor_label.show()
	await get_tree().create_timer(3.0).timeout
	get_tree().reload_current_scene()

func _on_flame_died() -> void:
	state = State.END
	if pattern != null:
		pattern.stop()
	enemy_line_label.hide()
	death_label.show()
	await get_tree().create_timer(1.8).timeout
	get_tree().reload_current_scene()

# --- hud ---

func _update_enemy_label() -> void:
	enemy_label.text = "%s   %d / %d" % [def.enemy_name, enemy_wick, def.enemy_wick]

func _update_status(current: int, max_value: int) -> void:
	status_label.text = "WICK %d/%d   BREATH %d/%d" % [
		current, max_value, GameState.breath_max, GameState.breath_max]

func _popup(text: String) -> void:
	popup_label.text = text
	popup_label.show()
	await get_tree().create_timer(0.8).timeout
	popup_label.hide()
