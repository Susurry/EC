extends PNJ
class_name PNJCar

@export var path_size: int

var manager: Node2D
var spawn_id: int
var spawn_point: Vector2
var targets: Array[Vector2]
var skin_texture: Texture2D
var target_pos: Vector2
var target_save: Vector2
var end_target_id: int
var trajet_pause: bool = false
var current_target: int = 1
var target_array: Array

@onready var animation_player = $Skin/AnimationPlayer

func _ready() -> void:
	super()

func initialize_pawn() -> void:
	await get_tree().physics_frame
	randomize()
	
	# Pour le spawn du PNJ
	#if i.id == spawn_id:
	target_pos = target_array[current_target].position
	set_movement_target(target_pos)

func _on_navigation_agent_2d_navigation_finished() -> void:
	current_target += 1
	if current_target >= target_array.size() - 1:
		queue_free()
		manager.initialize_pnj()
	else :
		current_target += 1
		set_movement_target(target_array[current_target].position)
		visible = false
		position = target_array[current_target-1].position
		
		#match manager.target_array[current_target-1].anim:
			#"right":
				#animation_player.play("walk_right")
				#
			#"left":
				#animation_player.play("walk_left")
				#
			#"down":
				#animation_player.play("walk_down")
				#
			#"up":
				#animation_player.play("walk_up")
				
		
		

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
