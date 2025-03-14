extends Node2D

@onready var pnj_asset = preload("uid://bcny5exc06a15")

var path_target_array: Array[Vector2]
var spawn_target_array: Array[Vector2]

func _ready() -> void:
	initialize_paths()
	initialize_pnj()

func initialize_paths() -> void:
	for i in $Middle_Targets.get_children():
		path_target_array.append(i.position)
	
	for i in $End_Targets.get_children():
		spawn_target_array.append(i.position)

func initialize_pnj() -> void:
	var pnj_instance: Node2D = pnj_asset.instantiate()
	
	pnj_instance.manager = self
	pnj_instance.position = spawn_target_array[randi_range(0, spawn_target_array.size() - 1)]
	pnj_instance.spawn_point = pnj_instance.position
	
	get_parent().call_deferred("add_child", pnj_instance)
