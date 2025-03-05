class_name CardBoard

extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		var card_ui := child as CardUI
		card_ui.parent = self
		card_ui.on_card_reloacte.connect(_on_card_relocate)

func _on_card_relocate(card: CardUI) -> void:
	card.reparent(self)
