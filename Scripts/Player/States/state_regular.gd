extends PlayerState

var canMove: bool = true

func step(player: Player, _delta: float) -> void:
	player.handle_input()
	player.handle_interact()
	
	player.velocity = player.input_direction.normalized() * player.SPEED
	player.move_and_slide()

func animate(player: Player, _delta: float) -> void:
	if (player.input_direction):
		player.skin.set_animation_state(PlayerSkin.ANIMATION_STATES.walk)
		player.skin.set_animation_direction(player.input_direction)
	else:
		player.skin.set_animation_state(PlayerSkin.ANIMATION_STATES.idle)
