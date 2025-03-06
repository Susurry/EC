extends CharacterBody2D
class_name Pawn

const SPEED: float = 50

@onready var skin: PawnSkin = $Skin
@onready var state_machine: StateMachine = $StateMachine
@onready var navigationAgent: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	initialize_state_machine()
	initialize_pawn()

func initialize_state_machine() -> void:
	state_machine.initialize()

func _physics_process(delta):
	handle_state_update(delta)
	handle_state_animation(delta)

func initialize_pawn():
	pass
	# Pour NPC
	# Wait for the first physics frame so the NavigationServer can sync.
	# await get_tree().physics_frame
	# Now that the navigation map is no longer empty, set the movement target.
	# if target:
	#	set_movement_target(target)

func handle_state_update(delta: float) -> void:
	state_machine.update_state(delta)

func handle_state_animation(delta) -> void:
	state_machine.animate_state(delta)

func set_movement_target(movement_target: Vector2):
	navigationAgent.target_position = movement_target

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()

func _on_navigation_agent_2d_navigation_finished() -> void:
	pass
	#set_movement_target(target)
