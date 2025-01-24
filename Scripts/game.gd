extends Node2D

class_name Game

static var level_container
static var ui

func _ready() -> void:
	assert(level_container == null)
	assert(ui == null)
	level_container = $SubViewportContainer/SubViewport
	ui = $UI
