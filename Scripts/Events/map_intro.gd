extends Node2D

@export var timeline: String

func _ready() -> void:
	if SaveManager.getElement("Events", timeline) == null:
		SaveManager.setElement("Events", {timeline: false})
		Dialogic.start(timeline)
