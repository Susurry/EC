extends Node2D
class_name Minigame

@export var window_size: Vector2
@export var end_timeline: String
@export var bookmark: int

var minigame_manager: Control

func quit_minigame() -> void:
	minigame_manager.erase_minigame(end_timeline, bookmark)
