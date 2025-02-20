extends Node2D

var can_pause: bool = true

func _ready() -> void:
	Dialogic.timeline_started.connect(onTimelineStarted)
	Dialogic.timeline_ended.connect(onTimelineEnded)

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("pause")):
		if can_pause:
			EventBus.emit_signal("set_pause")

func onTimelineStarted() -> void:
	can_pause = false

func onTimelineEnded() -> void:
	can_pause = true
