extends CharacterBody2D
class_name Player

const SPEED: float = 50

@onready var skin: PlayerSkin = $Skin
@onready var state_machine: PlayerStateMachine = $StateMachine

var propsAround : Array[GenericProp]
var propCurrentlyInteractingWith : GenericProp

var canMove : bool = true

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
	if (canMove):
		var horizontal: float = Input.get_axis("left", "right")
		var vertical: float = Input.get_axis("up", "down")
		input_direction = Vector2(horizontal, vertical)
	else:
		input_direction = Vector2(0, 0)

func handle_state_update(delta: float):
	state_machine.update_state(delta)

func handle_state_animation(delta):
	state_machine.animate_state(delta)
	
func _input(event):
	if event.is_action_pressed("interact") :
		if(propsAround.size() != 0) :
			propCurrentlyInteractingWith = propsAround[0]
			propCurrentlyInteractingWith.onInteract.emit()
			canMove = false
	if event.is_action_pressed("leave_interact") :
		if (propCurrentlyInteractingWith != null) :
			propCurrentlyInteractingWith._onGenericPropLeave()
			propCurrentlyInteractingWith = null
			canMove = true
