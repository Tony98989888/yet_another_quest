class_name PlayerStats
extends CharacterStats

@export var starting_deck: CardPile
@export var cards_per_turn: int
@export var max_mana: int

var mana: int : set = set_mana

var deck: CardPile
var discard: CardPile
var draw_pile: CardPile

func set_mana(value: int):
	mana = value
	on_character_stats_changed.emit()
	
func reset_mana():
	self.mana = max_mana
	
func can_play_card(card: CardConfig):
	return true
	
func create_instance() -> Resource:
	var instance: PlayerStats = self.duplicate()
	instance.hp = max_hp
	instance.shield = 0
	instance.reset_mana()
	instance.deck = instance.starting_deck.duplicate()
	instance.draw_pile = CardPile.new()
	instance.discard = CardPile.new()
	return instance
