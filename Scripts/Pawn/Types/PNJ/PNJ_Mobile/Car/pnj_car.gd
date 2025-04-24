extends PNJ
class_name PNJCar

@export var path_size: int

var manager: Node2D
var spawn_id: int
var spawn_point: Vector2
var targets: Array[Vector2]
var skin_texture: Texture2D
var end_target_pos: Vector2
var target_save: Vector2
var end_target_id: int
var trajet_pause: bool = false


func _ready() -> void:
	super()

func initialize_pawn() -> void:
	await get_tree().physics_frame
	randomize()
	
	# Pour le spawn du PNJ
	
	for i in manager.end_target_array:
		if i.id == spawn_id:
			end_target_pos = i.position
			set_movement_target(end_target_pos)

func _on_navigation_agent_2d_navigation_finished() -> void:
	queue_free()
	manager.initialize_pnj()

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()

func _on_detecteur_car_body_entered(body: Node2D) -> void:
	if body is PNJCar:
		return
	
	if body is Pawn:
		state_machine.change_state("Regular")

func _on_detecteur_car_body_exited(body: Node2D) -> void:
	if body is PNJCar:
		return
	
	if body is Pawn:
		state_machine.change_state("Pathfinding")
