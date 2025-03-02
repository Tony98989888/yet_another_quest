class_name CardState
extends Node

enum State {
	IDLE,
	SELECTED,
	DRAGGING,
	AIMING,
	RELEASED
}


signal state_changed(previous_state: CardState, new_state: State)

@export var state: State

var card_ui: CardUI

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func on_input(_evnt: InputEvent) -> void:
	pass
	
func on_gui_input(_evnt: InputEvent) -> void:
	pass
	
func on_mouse_entered() -> void:
	pass
	
func on_mouse_exited() -> void:
	pass
