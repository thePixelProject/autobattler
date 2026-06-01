extends CardState

func enter() -> void:
	card_ui.original_parent = card_ui.get_parent()

	var ui_layer := get_tree().get_first_node_in_group("ui_layer")

	if ui_layer:
		card_ui.reparent(ui_layer)

	card_ui.color.color = Color.WEB_PURPLE
	card_ui.state.text = "DRAGGING"
	
func on_input(event: InputEvent) -> void:
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = (
		event.is_action_released("left_mouse") 
		)
	
	if mouse_motion:
		card_ui.global_position = (
			card_ui.get_global_mouse_position() - card_ui.pivot_offset
			)
		
	if cancel:
		card_ui.return_to_origin()
		transition_requested.emit(self, CardState.State.BASE)
		
	elif confirm:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)
	
	
	
