extends CardState

const MOUSE_Y_SNAPBACK_THRESHOLD := 60

func enter() -> void:
	card_ui.color_rect.color = Color.CADET_BLUE
	card_ui.card_label.text = "AIMING STATE"
	card_ui.collide_objects.clear()

	var offset := Vector2(card_ui.parent.size.x /2, -card_ui.parent.size.y / 2)
	offset.x -= card_ui.size.x / 2
	card_ui.animate_to_position(card_ui.parent.global_position + offset, 0.2)
	card_ui.collision_detector.monitoring = false
	EventBus.card_aim_started.emit(card_ui)


func exit() -> void:
	EventBus.card_aim_ended.emit(card_ui)

func on_input(_evnt: InputEvent) -> void:
	var mouse_motion := _evnt is InputEventMouseMotion

	if (mouse_motion and false) or _evnt.is_action_pressed("right_mouse"):
		on_state_change.emit(self, CardState.State.IDLE)
	elif _evnt.is_action_released("left_mouse") or _evnt.is_action_pressed("left_mouse"):
		get_viewport().set_input_as_handled()
		on_state_change.emit(self, CardState.State.RELEASED)
