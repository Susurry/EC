extends PNJ
class_name PNJMobile

@export var targets: Node2D

var target_array: Array
var target_id: int = 0

func initialize_pawn():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
	target_array = targets.get_children()
	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(target_array[target_id].position)
	#Pensez à connecter les signaux !

func _on_navigation_agent_2d_navigation_finished() -> void:
	if target_id >= target_array.size() - 1:
		queue_free()
	else:	
		target_id += 1
		set_movement_target(target_array[target_id].position)
	
	#Faire le PNJ Manager.
