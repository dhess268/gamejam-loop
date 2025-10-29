extends Node

# Card related events
signal card_drag_started(card: CardUi)
signal card_drag_ended(card: CardUi)
signal card_aim_started(card: CardUi)
signal card_aim_ended(card: CardUi)
signal card_played(card: Card)
signal card_tooltip_requested(icon: Texture, text: String)
signal tooltip_hide_requested

# Player related events
signal player_hand_drawn
signal player_hand_discard
signal player_turn_ended
signal player_died

#Enemy related events
signal enemy_action_completed(enemy: Enemy)
signal enemy_turn_ended()
