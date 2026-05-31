extends CardState

func enter() -> void:
	card_ui.color.color = Color.TOMATO
	card_ui.state.text = "RELEASED"
