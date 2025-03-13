extends Node2D

@onready var pnj_asset = preload("uid://bcny5exc06a15")

var middle_target_array: Array[Vector2]
var spawn_target_array: Array[Vector2]

func _ready() -> void:
	for i in $Middle_Targets.get_children():
		middle_target_array.append(i.position)
	
	for i in $End_Targets.get_children():
		spawn_target_array.append(i.position)
	
	instantiate_pnj()

func instantiate_pnj() -> void:
	var pnj_instance: Node2D = pnj_asset.instantiate()
	
	pnj_instance.manager = self
	pnj_instance.position = spawn_target_array[randi_range(0, 1)]
	pnj_instance.spawn_point = pnj_instance.position
	
	get_parent().call_deferred("add_child", pnj_instance)
