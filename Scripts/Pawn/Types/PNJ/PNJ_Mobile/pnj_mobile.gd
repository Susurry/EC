extends PNJ
class_name PNJMobile

@export var middle_targets: Node2D
@export var spawn_targets: Node2D

var spawn_point: Node2D
var middle_target_array: Array
var spawn_target_array: Array
var target_id: int = 0

var targets: Array[Vector2]

func initialize_pawn():
	await get_tree().physics_frame
	middle_target_array = middle_targets.get_children()
	spawn_target_array = spawn_targets.get_children()
	
	randomize()
	
	var last_target: int
	while targets.size() < 3:
		var rng_middle_target: int = randi_range(0, 2)
		if rng_middle_target != last_target:
			last_target = rng_middle_target
			targets.append(middle_target_array[rng_middle_target].position)
	
	var rng_end_target: int = randi_range(0, 1)
	targets.append(spawn_target_array[rng_end_target].position)
	
	set_movement_target(targets[target_id])

func _on_navigation_agent_2d_navigation_finished() -> void:
	target_id += 1
	if target_id >= targets.size():
		queue_free()
	else:
		set_movement_target(targets[target_id])
