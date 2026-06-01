extends CardState

func enter() -> void:
	card_ui.color.color = Color.WEB_GREEN
	card_ui.state.text = "RELEASED"

	if not card_ui.targets.is_empty():

		var player_hand := get_tree().get_first_node_in_group("player_hand")

		if player_hand:
			card_ui.reparent(player_hand)

	else:
		card_ui.return_to_origin()
	card_ui.targets.clear()
	transition_requested.emit(self, CardState.State.BASE)
	
func exit() -> void:
	card_ui.drop_point_detector.monitoring = false
	card_ui.targets.clear()
