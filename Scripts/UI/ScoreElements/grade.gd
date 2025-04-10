extends Control

@export var timer_element: Control
@export var carbone_element: Control
@export var follower_element: Control

@onready var grade_label = $PanelLabel/Label

func _ready() -> void:
	timer_element.time_multi_label.text = ">>>"

func update_grading() -> void:
	var grading_score: float = carbone_element.empreinte - floor(follower_element.follower/4)
	match grading_score:
		var x when x >= 18:
			grade_label.text = "F"
			timer_element.time_multi = 1.5
			timer_element.time_multi_label.text = ">>>>>"
		var x when x < 18 and x >= 15:
			grade_label.text = "E"
			timer_element.time_multi = 1.5
			timer_element.time_multi_label.text = ">>>>>"
		var x when x < 15 and x >= 12:
			grade_label.text = "D"
			timer_element.time_multi = 1.2
			timer_element.time_multi_label.text = ">>>>"
		var x when x < 12 and x >= 9:
			grade_label.text = "C"
			timer_element.time_multi = 1
			timer_element.time_multi_label.text = ">>>"
		var x when x < 9 and x >= 6:
			grade_label.text = "B"
			timer_element.time_multi = 0.8571
			timer_element.time_multi_label.text = ">>"
		var x when x < 6 and x > 2 :
			grade_label.text = "A"
			timer_element.time_multi = 0.75
			timer_element.time_multi_label.text = ">"
		var x when x <= 2:
			grade_label.text = "S"
			timer_element.time_multi =  0.75
			timer_element.time_multi_label.text = ">"
