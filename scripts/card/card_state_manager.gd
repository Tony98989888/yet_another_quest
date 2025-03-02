class_name CardStateManager
extends Node


@export var init_state : CardState

var current_state : CardState
var available_states := {}

func init(card : CardUI) -> void:
	for child in self.get_children():
		if child is CardState:
			available_states[child.state] = child
			child.on_state_change.connect(_on_card_state_change)
			child.card_ui = card
	
	if init_state:
		init_state.enter()
		current_state = init_state
		
func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)
		
func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()
		
func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()
		
		
func _on_card_state_change(previous_state: CardState, new_state: CardState.State) -> void:
	if previous_state != current_state:
		return
		
	var next_state : CardState = available_states[new_state]
	if not next_state:
		return
		
	if current_state:
		current_state.exit()
	
	next_state.enter()
	current_state = next_state
