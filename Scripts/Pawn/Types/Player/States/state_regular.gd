extends PawnState

var canMove: bool = true

func _ready() -> void:
	Dialogic.timeline_started.connect(onTimelineStarted)

func step(pawn: Pawn, _delta: float) -> void:
	pawn.handle_input()
	pawn.handle_sprint()
	pawn.handle_interact()
	
	pawn.velocity = pawn.input_direction.normalized() * pawn.curr_speed
	
	pawn.move_and_slide()

func animate(pawn: Pawn, _delta: float) -> void:
	if (pawn.input_direction and pawn.get_real_velocity()):
		if (pawn.curr_speed == pawn.SPRINT_SPEED):
			pawn.skin.set_animation_speed(2.0)
		else:
			pawn.skin.set_animation_speed(1.0)
		
		pawn.skin.set_animation_state(PawnSkin.ANIMATION_STATES.walk)
		pawn.skin.set_animation_direction(pawn.input_direction)
	else:
		pawn.skin.set_animation_speed(1.0)
		pawn.skin.set_animation_state(PawnSkin.ANIMATION_STATES.idle)

func onTimelineStarted() -> void:
	get_parent().change_state("Interacting")
