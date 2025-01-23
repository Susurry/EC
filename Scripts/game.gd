extends Node2D

static var level_container

func _ready() -> void:
	assert(level_container == null)
	level_container = $SubViewportContainer/SubViewport
