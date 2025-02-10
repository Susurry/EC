extends CharacterBody2D
class_name Player

const SPEED: float = 50

@onready var skin: PlayerSkin = $Skin
@onready var state_machine: PlayerStateMachine = $StateMachine

var props_around: Array[Prop]

var input_direction: Vector2
var input_interact: bool

func _ready() -> void:
	initialize_state_machine()

func _physics_process(delta: float) -> void:
	handle_state_update(delta)
	handle_state_animation(delta)

func initialize_state_machine() -> void:
	state_machine.initialize()

func handle_input() -> void:
	input_direction = Game.inputs.get_direction()

func handle_interact() -> void:
	if (Game.inputs.is_interacting()):
		if (props_around):
			props_around[props_around.size()-1].on_interact(self)
			state_machine.change_state("Interacting")

func handle_state_update(delta: float) -> void:
	state_machine.update_state(delta)

func handle_state_animation(delta) -> void:
	state_machine.animate_state(delta)
