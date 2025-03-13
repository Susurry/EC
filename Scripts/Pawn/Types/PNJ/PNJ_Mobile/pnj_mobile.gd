extends PNJ
class_name PNJMobile

var manager: Node2D
var spawn_point: Vector2
var target_id: int = 0
var targets: Array[Vector2]

func initialize_pawn():
	await get_tree().physics_frame	
	randomize()
	
	var last_target: int
	while targets.size() < 3:
		var rng_middle_target: int = randi_range(0, 2)
		if rng_middle_target != last_target:
			last_target = rng_middle_target
			targets.append(manager.middle_target_array[rng_middle_target])
	
	var wanted_size: int = targets.size() + 1
	while targets.size() < wanted_size:
		var rng_end_target: int = randi_range(0, 1)
		var end_point: Vector2 = manager.spawn_target_array[rng_end_target]
		if spawn_point != end_point:
			targets.append(end_point)
	
	set_movement_target(targets[target_id])

func _on_navigation_agent_2d_navigation_finished() -> void:
	target_id += 1
	if target_id >= targets.size():
		queue_free()
		manager.instantiate_pnj()
	else:
		set_movement_target(targets[target_id])
