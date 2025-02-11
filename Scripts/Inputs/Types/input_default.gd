extends InputManager

func get_direction() -> Vector2:
	var horizontal: float = Input.get_axis("left", "right")
	var vertical: float = Input.get_axis("up", "down")
	return Vector2(horizontal, vertical)

func is_sprinting() -> bool:
	return Input.is_action_pressed("sprint")

func is_interacting() -> bool:
	return Input.is_action_just_pressed("interact")
