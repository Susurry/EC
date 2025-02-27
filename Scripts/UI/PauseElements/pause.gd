extends Node2D

var can_pause: bool = true
var in_minigame: bool = false

func _ready() -> void:
	Dialogic.timeline_started.connect(onTimelineStarted)
	Dialogic.timeline_ended.connect(onTimelineEnded)
	EventBus.add_signal("minigame_toggle", set_in_minigame)

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("pause")):
		if can_pause and !in_minigame:
			EventBus.emit_signal("set_pause")

func onTimelineStarted() -> void:
	can_pause = false

func onTimelineEnded() -> void:
	can_pause = true

func set_in_minigame(arg: bool):
	in_minigame = arg
