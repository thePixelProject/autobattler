extends CardState

func enter() -> void:
	card_ui.color.color = Color.DARK_CYAN
	card_ui.state.text = "PRESSED"
	card_ui.drop_point_detector.monitoring = true
	
func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		transition_requested.emit(self, CardState.State.DRAGGING)

	elif event.is_action_released("left_mouse"):
		transition_requested.emit(self, CardState.State.BASE)
