extends Control

@onready var grade_label = $PanelLabel/Label
@onready var carbone_element = get_parent().get_node("Carbone")
@onready var timer_element = get_parent().get_node("Timer")

func update_grading() -> void:
	match carbone_element.empreinte:
		var x when x >= 60:
			grade_label.text = "A"
			timer_element.time_multi = 0.75
		var x when x >= 40 and x < 60:
			grade_label.text = "B"
			timer_element.time_multi = 0.8571
		var x when x > -40 and x < 40:
			grade_label.text = "C"
			timer_element.time_multi = 1
		var x when x > -60 and x <= -40:
			grade_label.text = "D"
			timer_element.time_multi = 1.2
		var x when x <= -60:
			grade_label.text = "E"
			timer_element.time_multi = 1.5
