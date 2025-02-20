extends Control

func _ready() -> void:
	intialize_pause()

func intialize_pause() -> void:
	visible = false
	EventBus.add_signal("set_pause", toggle_pause)

func toggle_pause() -> void:
	if get_tree().paused:
		get_tree().paused = false
		visible = false
	else :
		get_tree().paused = true
		visible = true

func _on_quitter_pressed() -> void:
	get_tree().quit()
