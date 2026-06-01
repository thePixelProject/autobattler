class_name ShopCards
extends HBoxContainer

func _ready() -> void:
	for child in get_children():
		if child is CardUI:
			var card_ui: CardUI = child
			card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)

func _on_card_ui_reparent_requested(child: CardUI) -> void:
	print("Shop reclaiming card")
	child.reparent(self)
