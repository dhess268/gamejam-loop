extends Node2D

@export var time_seg_index: int = 4

@onready var enemy_action_icon: TextureRect = $EnemyActionIcon
@onready var player_action_icon: TextureRect = $PlayerActionIcon
@onready var arrow_sprite: Sprite2D = $ArrowSprite

@onready var card_ui: CardUi

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Events.card_played.connect(_on_card_added_to_timeline)
	#Events.turn_change.connect(_on_turn_changed)
	#Events.add_to_timeline.connect(_on_card_added_to_timeline)
	pass # Replace with function body.


# WHEN A CARD IS PLAYED, assign that card to here
# change player action icon to the card's icon
#func _on_card_added_to_timeline(card_added: CardUi):
	#card_ui = card_added
	#player_action_icon.texture = card_added.card.icon
#
#
#func _on_turn_changed(index: int):
	#if !card_ui:
		#return
	#print(index, time_seg_index)
	#if 4 == index :
		#print('doing')
		#card_ui.play()

func _on_area_entered(_area: Area2D) -> void:
	arrow_sprite.show()
	

func _on_area_exited(_area: Area2D) -> void:
	arrow_sprite.hide()


func _on_time_segment_area_entered(_area: Area2D) -> void:
	arrow_sprite.show()


func _on_time_segment_area_exited(_area: Area2D) -> void:
	arrow_sprite.hide()
