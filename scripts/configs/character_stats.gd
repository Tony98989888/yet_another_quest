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
	
func take_damage(value: int):
	if value <= 0:
		return
	
	var initial_damage = value
	value = clampi(value - shield, 0, value)
	self.shield = clampi(shield - initial_damage, 0, shield)
	self.hp -= value
	
func heal(amount: int):
	self.hp += amount
	
func create_instance() -> Resource:
	var instance: CharacterStats = self.duplicate()
	instance.hp = max_hp
	instance.shield = 0
	return instance
