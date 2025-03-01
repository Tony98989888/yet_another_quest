class_name CardUI
extends Control

signal reparent_requested(card: CardUI)

@onready var color_rect: ColorRect = $ColorRect
@onready var card_label: Label = $Label

@onready var collision_detector: Area2D = $"%CollisionDetector"
