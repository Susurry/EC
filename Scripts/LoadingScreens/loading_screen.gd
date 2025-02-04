extends Node2D

@export var transitions: Resource
var next_scene: Node2D
var transition_key: String

func _ready() -> void:
	initialize_load_type()

func initialize_load_type() -> void:
	if transition_key.is_empty():
		ThreadLoad.trigger_next_scene(next_scene)
	else:
		var load_trans: Node2D = load(transitions.types[transition_key]).instantiate()
		add_child(load_trans)

func _on_event_trigger() -> void:
	ThreadLoad.trigger_next_scene(next_scene)
