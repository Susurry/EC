extends Node2D

var can_pause: bool = true
var is_blocked: bool = false

func _ready() -> void:
	Dialogic.timeline_started.connect(onTimelineStarted)
	Dialogic.timeline_ended.connect(onTimelineEnded)
	EventBus.add_signal("block_player_state", set_blocked)

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("pause")):
		if can_pause and !is_blocked:
			EventBus.emit_signal("set_pause")

func onTimelineStarted() -> void:
	can_pause = false

func onTimelineEnded() -> void:
	can_pause = true

func set_blocked(arg: bool):
	is_blocked = arg
