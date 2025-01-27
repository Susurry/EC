extends Control

var score: int = 0

@onready var score_label = $Score

func _ready() -> void:
	score += 30
	score_label.text = "Pollution Score : " + str(score)
	
func on_update_score(arg: int) -> void:
	score += arg
	score_label.text = "Pollution Score : " + str(score)
