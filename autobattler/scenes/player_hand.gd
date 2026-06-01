class_name PlayerHand
extends HBoxContainer

func _ready() -> void:
	for card in get_tree().get_nodes_in_group("cards"):
		card.move_to_hand_requested.connect(_on_move_to_hand_requested)

func _on_move_to_hand_requested(card: CardUI) -> void:
	card.reparent(self)
