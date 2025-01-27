extends Node2D

@export var player_resource: PackedScene 

var player: Player
var start_id: int = 0

func _ready() -> void:
	initialize_player()

func initialize_player():
	player = player_resource.instantiate()
	player.position = $StartPoints.get_child(start_id).position # Ordre du child important
	add_child(player)
