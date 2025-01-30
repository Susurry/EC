extends Camera2D

var target: Node2D

func _process(_delta: float) -> void:
	position = target.position
