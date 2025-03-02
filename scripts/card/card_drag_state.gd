extends CardState

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		card_ui.reparent(ui_layer)

	card_ui.color_rect.color = Color.BLUE_VIOLET
	card_ui.card_label.text = "DRAGGING STATE"

func on_input(_evnt: InputEvent) -> void:
	var mouse_motion := _evnt is InputEventMouseMotion
	var cancel = _evnt.is_action_pressed("right_mouse")
	var confirm = _evnt.is_action_released("left_mouse") or _evnt.is_action_pressed("left_mouse")

	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset

	if cancel:
		state_changed.emit(self, CardState.State.IDLE)
	elif confirm:
		get_viewport().set_input_as_handled()
		# prevent select instantly after dropping
		state_changed.emit(self, CardState.State.RELEASED)
