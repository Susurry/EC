extends PlayerState

func step(player: Player, _delta: float) -> void:
	# Temporaire
	player.handle_interact()

func animate(player: Player, _delta: float) -> void:
	player.skin.set_animation_state(PlayerSkin.ANIMATION_STATES.idle)
