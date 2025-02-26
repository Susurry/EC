extends Node2D

func _ready() -> void:
	EventBus.emit_signal("set_mission_name", "Sensibliser les étudiants")
	Dialogic.start("Introduction")
