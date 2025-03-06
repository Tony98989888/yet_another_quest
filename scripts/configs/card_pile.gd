class_name CardPile
extends Resource

signal on_pile_size_change(size: int)

@export var cards: Array[CardConfig] = []

func is_empty() -> bool:
	return cards.is_empty()

func draw_card() -> CardConfig:
	var card = cards.pop_front()
	on_pile_size_change.emit(cards.size())
	return card

func add_card(card:CardConfig):
	cards.append(card)
	on_pile_size_change.emit(cards.size())

func shuffle():
	cards.shuffle()

func clear():
	cards.clear()
	on_pile_size_change.emit(cards.size())

func _to_string() -> String:
	var _description: PackedStringArray = []
	for i in range(cards.size()):
		_description.append("$s : %s" % [i + 1, cards[i].id])

	return "\n".join(_description)
