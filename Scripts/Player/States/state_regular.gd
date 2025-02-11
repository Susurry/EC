extends PlayerState

var canMove: bool = true

func step(player: Player, _delta: float) -> void:
	player.handle_input()
	player.handle_sprint()
	player.handle_interact()
	
	player.velocity = player.input_direction.normalized() * player.curr_speed
	
	player.move_and_slide()

func animate(player: Player, _delta: float) -> void:
	if (player.input_direction and player.get_real_velocity()):
		if (player.curr_speed == player.SPRINT_SPEED):
			player.skin.set_animation_speed(2.0)
		else:
			player.skin.set_animation_speed(1.0)
		
		player.skin.set_animation_state(PlayerSkin.ANIMATION_STATES.walk)
		player.skin.set_animation_direction(player.input_direction)
	else:
		player.skin.set_animation_state(PlayerSkin.ANIMATION_STATES.idle)
