extends Node2D

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("pause")):
		if get_tree().paused == true:
			get_tree().paused = false
			Game.ui.pause_element.visible = false
		else :
			get_tree().paused = true
			Game.ui.pause_element.visible = true
