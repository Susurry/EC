extends Control

@export var exit_button_offset: Vector2

@onready var list_minigame: Resource = preload("uid://bkhn78x1ls0qp")
@onready var exit_button: Button = $Button
@onready var target: SubViewport = $CenterContainer/MinigameSVC/SubViewport
@onready var SubViewContainer: SubViewportContainer = $CenterContainer/MinigameSVC

func _ready() -> void:
	_initialize_signals() 

func _initialize_signals() -> void:
	EventBus.add_signal("setup_minigame", setup_minigame)

func setup_minigame(minigame_name: String) -> void:
	var minigame_load = load(list_minigame.dictionnary_minigame[minigame_name])
	var minigame_instance: Node2D = minigame_load.instantiate()
	
	minigame_instance.minigame_manager = self
	SubViewContainer.custom_minimum_size =  minigame_instance.window_size
	exit_button.position = ((size - SubViewContainer.custom_minimum_size) / 2) - exit_button_offset
	
	target.add_child(minigame_instance)
	EventBus.emit_signal("in_game_event_active", true)
	visible = true
	
func erase_minigame(timeline: String = "", bookmark: int = 0) -> void:
	for n in target.get_children():
		n.queue_free()
		
	visible = false

	if timeline:
		Dialogic.start(timeline, "book" + str(bookmark))
		await Dialogic.timeline_started
	
	
	EventBus.emit_signal("in_game_event_active", false)
