extends CollisionShape2D

#func _on_animation_player_animation_changed(old_name: StringName, new_name: StringName) -> void:
	#match new_name:
		#"walk_down":
			#position = Vector2(0, 28)
			#shape.size = Vector2(32, 6)
		#"walk_up":
			#position = Vector2(0, -28)
			#shape.size = Vector2(32, 6)
		#"walk_right":
			#position = Vector2(28, 0)
			#shape.size = Vector2(6, 32)
		#"walk_left":
			#position = Vector2(-28, 0)
			#shape.size = Vector2(6, 32)
	#print(new_name)
