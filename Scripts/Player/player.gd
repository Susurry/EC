extends CharacterBody2D
class_name Player

const SPEED: float = 50

@onready var skin: PlayerSkin = $Skin
@onready var state_machine: PlayerStateMachine = $StateMachine

var input_direction: Vector2

func _ready() -> void:
	initialize_state_machine()

func _physics_process(delta: float) -> void:
	handle_input()
	handle_state_update(delta)
	handle_state_animation(delta)

func initialize_state_machine():
	state_machine.initialize()

func handle_input():
	var horizontal: float = Input.get_axis("left", "right")
	var vertical: float = Input.get_axis("up", "down")
	input_direction = Vector2(horizontal, vertical)

func handle_state_update(delta: float):
	state_machine.update_state(delta)

func handle_state_animation(delta):
	state_machine.animate_state(delta)
