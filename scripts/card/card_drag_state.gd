extends CardState

const DRAG_THRESHOLD := 0.05
var is_drag_confirmed := false

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		card_ui.reparent(ui_layer)

	card_ui.color_rect.color = Color.BLUE_VIOLET
	card_ui.card_label.text = "DRAGGING STATE"

	# handle input
	is_drag_confirmed = false
	var drag_timer := get_tree().create_timer(DRAG_THRESHOLD, false)
	drag_timer.timeout.connect(func(): is_drag_confirmed = true)

func on_input(_evnt: InputEvent) -> void:
	var is_single_target_card := card_ui.config.is_single_targeted()

	var mouse_motion := _evnt is InputEventMouseMotion
	var cancel = _evnt.is_action_pressed("right_mouse")
	var confirm = _evnt.is_action_released("left_mouse") or _evnt.is_action_pressed("left_mouse")

	if is_single_target_card and mouse_motion and card_ui.collide_objects.size() > 0:
		on_state_change.emit(self, CardState.State.AIMING)
		return

	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset

	if cancel:
		on_state_change.emit(self, CardState.State.IDLE)
	elif confirm and is_drag_confirmed:
		get_viewport().set_input_as_handled()
		# prevent select instantly after dropping
		on_state_change.emit(self, CardState.State.RELEASED)
