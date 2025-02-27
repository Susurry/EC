extends Node2D

@export var timeline: String

func _on_button_pressed() -> void:
	get_parent().erase_minigame()
	Dialogic.start(timeline, "book2")
