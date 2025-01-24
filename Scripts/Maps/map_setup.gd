extends Node2D

@export var player_resource: PackedScene 

var player: Player

func _ready() -> void:
	initialize_player()

func initialize_player():
	player = player_resource.instantiate()
	
	# A revoir quand le système d'ID avec Thread Load sera mis en place
	player.position = $StartPoint.position
	add_child(player)
