extends PawnState

func step(pawn: Pawn, _delta: float) -> void:
	if pawn.allow_input():
		pawn.handle_interact()

func enter(pawn: Pawn) -> void:
	pawn.skin.set_animation_state(PawnSkin.ANIMATION_STATES.idle)
