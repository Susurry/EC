extends CollisionShape2D


func _on_animation_player_current_animation_changed(name_anim: String) -> void:
	match name_anim:
		"walk_down":
			position = Vector2(0, 28)
			shape.size = Vector2(32, 6)
		"walk_up":
			position = Vector2(0, -28)
			shape.size = Vector2(32, 6)
		"walk_right":
			position = Vector2(28, 0)
			shape.size = Vector2(6, 32)
		"walk_left":
			position = Vector2(-28, 0)
			shape.size = Vector2(6, 32)
