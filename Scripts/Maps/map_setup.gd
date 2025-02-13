extends Node2D
class_name Map

@export var background_color: Color
@export var limit_left: int = 0
@export var limit_right: int = 10000
@export var limit_top: int = 0
@export var limit_bottom: int = 10000

var player: Player
var camera: Camera2D
var start_id: int = 0

@onready var player_resource: PackedScene = preload("uid://cma8bt0crjux0")
@onready var camera_resource: PackedScene = preload("uid://cfutd05my7baa")
@onready var pause_ressource: PackedScene = preload("uid://bfwcj54nwr3on")

func _ready() -> void:
	initialize_bg_color()
	initialize_player()
	initialize_camera()
	initialize_pause()

func initialize_player() -> void:
	player = player_resource.instantiate()
	player.position = $StartPoints.get_child(start_id).position # Ordre du child important
	add_child(player)

func initialize_camera() -> void:
	camera = camera_resource.instantiate()
	camera.target = player
	camera.set_limits(limit_left, limit_right, limit_top, limit_bottom)
	add_child(camera)

func initialize_bg_color() -> void:
	RenderingServer.set_default_clear_color(background_color)
	
func initialize_pause() -> void:
	var pause = pause_ressource.instantiate()
	add_child(pause)
