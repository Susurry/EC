extends Node2D

class_name Game

static var ui

func _ready() -> void:
	assert(ui == null)
	ThreadLoad.viewport = $SubViewportContainer/SubViewport
	ui = $UI
