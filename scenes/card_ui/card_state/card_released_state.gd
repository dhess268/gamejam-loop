extends CardState
var played: bool
const RETURN_TO_HAND_TIME = .01
func enter() -> void:
	played = false
	
	if not card_ui.targets.is_empty():
		Events.tooltip_hide_requested.emit()
		Events.add_to_timeline.emit(card_ui)
		#card_ui.play()
		played = true
		print("play card for target(s)", card_ui.targets)

func on_input(_event: InputEvent) -> void:
	if played:
		return
	transition_requested.emit(self, CardState.State.BASE)
