extends CardState


func enter() -> void:
	card_ui.color_rect.color = Color.RED
	card_ui.card_label.text = "SELECTED STATE"
	card_ui.collision_detector.monitoring = true


func on_gui_input(_evnt: InputEvent) -> void:
	if _evnt is InputEventMouseMotion:
		on_state_change.emit(self, CardState.State.DRAGGING)
