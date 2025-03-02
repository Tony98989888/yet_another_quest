class_name CardUI
extends Control

signal reparent_requested(card: CardUI)

@onready var color_rect: ColorRect = $ColorRect
@onready var card_label: Label = $Label

@onready var collision_detector: Area2D = $"%CollisionDetector"

@onready var card_state_machine: CardStateManager = $CardStateManager as CardStateManager

func _ready():
	card_state_machine.init(self)

func _input(_evnt: InputEvent) -> void:
	card_state_machine.on_input(_evnt)
	
func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()
