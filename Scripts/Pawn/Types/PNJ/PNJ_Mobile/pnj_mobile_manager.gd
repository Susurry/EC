extends Node2D

@export var pnj_quantity: int = 0

@onready var pnj_asset: PackedScene = preload("uid://bcny5exc06a15")

var path_target_array: Array[Vector2]
var spawn_target_array: Array[Vector2]

func _ready() -> void:
	initialize_paths()
	for i in pnj_quantity:
		initialize_pnj()
		await get_tree().create_timer(1).timeout 

func initialize_paths() -> void:
	for i in $Middle_Targets.get_children():
		path_target_array.append(i.position)
	
	for i in $End_Targets.get_children():
		spawn_target_array.append(i.position)

func initialize_pnj() -> void:
	randomize()
	var pnj_instance: CharacterBody2D = pnj_asset.instantiate()
	
	pnj_instance.manager = self
	pnj_instance.position = spawn_target_array[randi_range(0, spawn_target_array.size() - 1)]
	pnj_instance.spawn_point = pnj_instance.position
	
	get_parent().call_deferred("add_child", pnj_instance)
