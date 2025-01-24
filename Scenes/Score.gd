extends Label

var score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score += 30
	text = "Pollution Score : " + str(score)
	
func on_update_score(arg : int) -> void:
	score += arg
	text = "Pollution Score : " + str(score)
