extends Node2D
class_name Game

@export var first_map: String
@export var controls: Resource

static var ui
static var inputs: InputManager

func _ready() -> void:
	_initialize_viewport()
	_initialize_inputs()
	ui = $UI

func _is_mobile() -> bool:
	return OS.has_feature("web_android") || OS.has_feature("web_ios")

func _initialize_viewport() -> void:
	ThreadLoad.initialize_viewport($SubViewportContainer/SubViewport)
	ThreadLoad.load_scene(first_map)

func _initialize_inputs() -> void:
	match OS.get_name():
		"Web":
			if _is_mobile():
				inputs = load(controls.types["Mobile"]).instantiate()
			else:
				inputs = load(controls.types["Default"]).instantiate()
		_: # Si pas sur plateforme web
			inputs = load(controls.types["Mobile"]).instantiate()
	
	add_child(inputs)
