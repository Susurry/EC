extends Node2D
class_name Map

@export var player_resource: PackedScene
@export var camera_resource: PackedScene 

var player: Player
var camera: Camera2D
var start_id: int = 0

func _ready() -> void:
	initialize_player()
	initialize_camera()

func initialize_player():
	player = player_resource.instantiate()
	player.position = $StartPoints.get_child(start_id).position # Ordre du child important
	add_child(player)

func initialize_camera():
	camera = camera_resource.instantiate()
	camera.target = player
	add_child(camera)
