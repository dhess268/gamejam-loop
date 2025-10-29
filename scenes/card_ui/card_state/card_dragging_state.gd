extends CardState

const DRAG_MINIMUM_THRESHOLD := 0.05

var minimum_drag_time_elapsed = false

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		card_ui.reparent(ui_layer)

	minimum_drag_time_elapsed = false
	Events.card_drag_started.emit(card_ui)

	var threshold_timer := get_tree().create_timer(DRAG_MINIMUM_THRESHOLD, false)
	threshold_timer.timeout.connect(func(): minimum_drag_time_elapsed = true)
	card_ui.panel.set("theme_override_styles/panel", card_ui.DRAGGING_STYLEBOX)

	
func on_input(event: InputEvent) -> void:
	var single_targeted_card := card_ui.card.is_single_targeted()
	var mouse_moition := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_pressed("left_mouse") or event.is_action_released("left_mouse")
	
	if single_targeted_card and mouse_moition and card_ui.targets.size() > 0:
		transition_requested.emit(self, CardState.State.AIMING)
		return

	if mouse_moition:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset

	if cancel:
		transition_requested.emit(self, CardState.State.BASE)

	elif minimum_drag_time_elapsed and confirm:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)

func exit():
	Events.card_drag_ended.emit(card_ui)
