extends Node2D


func _ready():
	Events.add_to_timeline.connect(_on_card_add_to_timeline)


func _on_card_add_to_timeline(card: CardUi) -> void:
	print('added', card)
