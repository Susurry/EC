extends Control

@onready var score_label : Label = $Score


func update_score(arg : int) -> void:
	score_label.on_update_score(arg)
