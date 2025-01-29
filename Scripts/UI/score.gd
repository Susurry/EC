extends Control

var score: int = 0

@onready var score_label = $Score
@onready var grade_label = $Grade
@onready var timer_element = get_parent().get_node("TimerElements")

func _ready() -> void:
	score_label.text = "Pollution Score : " + str(score)
	
func on_update_score(arg: int) -> void:
	score += arg
	score_label.text = "Pollution Score : " + str(score)
	_update_grading(score)

func _update_grading(score: int):
	match score:
		var x when x >= 60:
			grade_label.text = "A"
			timer_element.time_multi = 0.5
		var x when x >= 40 and x < 60:
			grade_label.text = "B"
			timer_element.time_multi = 0.75
		var x when x > -40 and x < 40:
			grade_label.text = "C"
			timer_element.time_multi = 1
		var x when x > -60 and x <= -40:
			grade_label.text = "D"
			timer_element.time_multi = 1.25
		var x when x <= -60:
			grade_label.text = "E"
			timer_element.time_multi = 1.5
