extends Node2D

@export var distance: float = 20.0

var player: Player
var start_pos: Vector2

func initialize_quest(player_obj: Player) -> void:
	player = player_obj
	start_pos = player.position

func _physics_process(_delta: float) -> void:
	if not player:
		return
		
	if player.position.distance_to(start_pos) > distance:
		check_mission_done()

func check_mission_done() -> void:
	if SaveManager.getElement("Quests", "0-1_deplacer") == false:
		print("mission is done")
		# MET TON TRUC DIALOGIC ICI POUR QUAND LA MISSION EST FINIE
	else:
		print("kill the mission")
		queue_free()
