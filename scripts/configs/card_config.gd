class_name CardConfig
extends Resource
enum CardType {ATTACK, DEFEND, POWER}
enum TargetType {SELF, SINGLE_ENEMY, ALL_ENEMIES, EVERYONE}

@export_group("Card Attributes")
@export var id: String
@export var card_type: CardType
@export var target_type: TargetType

func is_single_targeted() -> bool:
	return target_type == TargetType.SINGLE_ENEMY
