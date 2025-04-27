extends Node2D
class_name UIMap

func _ready() -> void:
	EventBus.emit_signal("set_ui_visibility", false)
	FadeManager.trigger_fade(0, 0.25, 3)
