extends Control

@onready var score_element: Control = $ScoreElements
@onready var time_element: Control = $TimerElements

func update_score(arg: int) -> void:
	score_element.on_update_score(arg)
