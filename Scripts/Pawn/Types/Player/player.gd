extends Pawn
class_name Player

const SPRINT_SPEED: float = 100

var props_around: Array[Prop]

var input_direction: Vector2
var input_interact: bool

var curr_speed: float

func handle_input() -> void:
	input_direction = Game.inputs.get_direction()

func handle_sprint() -> void:
	if (Game.inputs.is_sprinting()):
		curr_speed = SPRINT_SPEED
	else:
		curr_speed = SPEED

func handle_interact() -> void:
	if (Game.inputs.is_interacting()):
		if (props_around):
			props_around[props_around.size()-1].on_interact(self)
