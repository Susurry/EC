extends Control

func _on_retour_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_quitter_pressed() -> void:
	get_tree().quit()
