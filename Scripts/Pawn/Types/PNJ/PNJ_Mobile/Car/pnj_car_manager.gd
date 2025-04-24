extends Node2D

@export var car_quantity: int = 0

@onready var car_asset: PackedScene = preload("uid://crwrfx45qslht")

var end_target_array: Array[Marker2D]
var spawn_target_array: Array[Marker2D]

func _ready() -> void:
	initialize_paths()
	for i in car_quantity:
		# Crée un PNJ toutes les secondes, jusqu'au nombre de PNJ shouaité
		await get_tree().create_timer(2.5).timeout 
		initialize_pnj()

func initialize_paths() -> void:
	for i in $SpawnTargets.get_children():
		spawn_target_array.append(i)
	
	for i in $EndTargets.get_children():
		end_target_array.append(i)

func initialize_pnj() -> void:
	randomize()
	var pnj_instance: CharacterBody2D = car_asset.instantiate()
	pnj_instance.manager = self
	
	var rand_spawn = spawn_target_array[randi_range(0, spawn_target_array.size() - 1)]
	pnj_instance.position = rand_spawn.position
	pnj_instance.spawn_id = rand_spawn.id
	pnj_instance.spawn_point = pnj_instance.position
	#pnj_instance.skin_texture = pnj_instance.skin_car
	
	get_parent().call_deferred("add_child", pnj_instance)
	
