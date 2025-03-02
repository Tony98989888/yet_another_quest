extends CardState

var is_played: bool

func enter() -> void:
	card_ui.color_rect.color = Color.BISQUE
	card_ui.card_label.text = "RELEASED STATE"
	
	is_played = false
	if not card_ui.collide_objects.is_empty():
		is_played = true
		print("card played in area (s)", card_ui.collide_objects)
		
func on_input(_event: InputEvent) -> void:
	if is_played:
		return
		
	on_state_change.emit(self, CardState.State.IDLE)
