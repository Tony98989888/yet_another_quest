class_name CardUI
extends Control

signal on_card_reloacte(card: CardUI)

@onready var color_rect: ColorRect = $ColorRect
@onready var card_label: Label = $Label

@onready var collision_detector: Area2D = $"%CollisionDetector"

@onready var card_state_machine: CardStateManager = $CardStateManager as CardStateManager
@onready var collide_objects: Array[Node] = []

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


func _on_collision_detector_area_entered(area: Area2D) -> void:
	if not collide_objects.has(area):
		collide_objects.append(area)


func _on_collision_detector_area_exited(area: Area2D) -> void:
	collide_objects.erase(area)
