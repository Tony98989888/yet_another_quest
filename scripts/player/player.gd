class_name Player
extends Node2D

@onready var stats: CharacterStats : set set_character_stats

@onready var portrait: Sprite2D = $Sprite2D
@onready var stats_ui: StatsUI = $StatsUI

func set_character_stats(value: CharacterStats):
	stats = value.create_instance()
	if not stats.on_character_stats_changed.is_connected(update_character_stats):
		stats.on_character_stats_changed.connect(update_character_stats)
		
	update_player_portrait()
		
func update_player_portrait():
	if not stats is CharacterStats:
		return
		
	if not is_inside_tree():
		await ready
		
	portrait.texture = stats.portrait
	update_player_stats()
	
func update_player_stats():
	stats_ui.update_stats(stats)
	
	
func on_damage_received(value: int):
	if stats.hp <= 0:
		return
	
	stats.take_damage(value)
	if stats.hp <= 0:
		queue_free()
