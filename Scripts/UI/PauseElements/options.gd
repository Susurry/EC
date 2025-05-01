extends PanelContainer

func _ready() -> void:
	intialize_pause()

func intialize_pause() -> void:
	visible = false
	EventBus.add_signal("set_pause", _on_unpause_pressed)

func _on_unpause_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
		visible = false
	else :
		get_tree().paused = true
		visible = true

func _on_quit_game_pressed() -> void:
	get_tree().quit()

func _on_sprint_toggle_toggled(toggled_on: bool) -> void:
	Game.inputs.toggleable_sprint = toggled_on

func _on_fullscreen_toggle_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
