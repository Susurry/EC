extends Control

@onready var score_element: Control = $OWElements/ScoreElements
@onready var time_element: Control = $OWElements/TimerElements
@onready var debug_element: Control = $DebugElements
@onready var pause_element: Control = $PauseElements

func _ready() -> void:
	initialize_debug_tools()

func initialize_debug_tools() -> void:
	if !OS.is_debug_build():
		debug_element.queue_free()

func update_score(arg: int) -> void:
	score_element.on_update_score(arg)
