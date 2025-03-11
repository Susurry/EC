extends Node2D

var can_pause: bool = true
var in_event: bool = false

func _ready() -> void:
	Dialogic.timeline_started.connect(onTimelineStarted)
	Dialogic.timeline_ended.connect(onTimelineEnded)
	EventBus.add_signal("in_game_event_active", set_in_event)

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("pause")):
		if can_pause and not in_event:
			EventBus.emit_signal("set_pause")

func onTimelineStarted() -> void:
	can_pause = false

func onTimelineEnded() -> void:
	can_pause = true

func set_in_event(arg: bool):
	in_event = arg
