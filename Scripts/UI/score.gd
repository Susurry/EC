extends Control

var score: int = 0

@onready var score_label = $Score
@onready var grade_label = $Grade

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
		var x when x >= 40 and x < 60:
			grade_label.text = "B"
		var x when x > -40 and x < 40:
			grade_label.text = "C"
		var x when x > -60 and x <= -40:
			grade_label.text = "D"
		var x when x <= -60:
			grade_label.text = "E"
