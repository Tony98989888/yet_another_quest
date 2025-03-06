class_name CharacterStats
extends Resource

signal on_character_stats_changed

@export var max_hp := 10
@export var max_shield := 10
@export var portrait : Texture

var hp: int : set = set_hp
var shield: int : set = set_shield

func set_hp(value: int) -> void:
	hp = clampi(value, 0, max_hp)
	on_character_stats_changed.emit()

func set_shield(value: int) -> void:
	shield = clampi(value, 0, max_shield)
	on_character_stats_changed.emit()
