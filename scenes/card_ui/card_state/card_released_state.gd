extends CardState
var played: bool
const RETURN_TO_HAND_TIME = .01
func enter() -> void:
	card_ui.color.color = Color.WEB_PURPLE
	card_ui.state.text = "RELEASED"
	
	played = false
	
	if not card_ui.targets.is_empty():
		played = true
		print("play card for target(s)", card_ui.targets)

func on_input(_event: InputEvent) -> void:
	if played:
		return
	transition_requested.emit(self, CardState.State.BASE)
