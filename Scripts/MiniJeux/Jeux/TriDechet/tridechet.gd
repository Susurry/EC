extends Control

const ITEM_SPAWN_MARGIN: int = 50

@export var items: Array[PackedScene]
@export var max_trash_items: int

var score: float
var trash_count: int

func _ready() -> void:
	randomize()

func update_score(value: float) -> void:
	score += value
	print(score)

func _on_timer_timeout() -> void:
	if trash_count < max_trash_items:
		var trash_load = items[randi_range(0,items.size()-1)]
		var trash_instance: Node2D = trash_load.instantiate()
		
		trash_instance.position.x = randf_range(ITEM_SPAWN_MARGIN, size.x - ITEM_SPAWN_MARGIN)
		trash_instance.minigame_window = self
		
		add_child(trash_instance)
		trash_count += 1
	else:
		print("Ajout Score Final")
		get_parent().quit_minigame()
