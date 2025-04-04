class_name StatsUI

extends HBoxContainer


@onready var shield_container: HBoxContainer = $Shield
@onready var shield_label: Label = %ShieldLabel

@onready var health_container: HBoxContainer = $Hp
@onready var health_label: Label = %HpLabel

func update_stats(stats: CharacterStats):
	shield_label.text = str(stats.shield)
	health_label.text = str(stats.hp)
	
	shield_container.visible = stats.shield > 0
	health_container.visible = stats.hp > 0
