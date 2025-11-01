extends Node2D

@onready var arrow: Sprite2D = $Arrow


func _on_area_2d_area_entered(_area: Area2D) -> void:
	#arrow.show()
	pass



func _on_area_2d_area_exited(_area: Area2D) -> void:
	#arrow.hide()
	pass
