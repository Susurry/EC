extends Control

@export var items: Array[PackedScene]
@export var item_spawn_margin: int

func _ready() -> void:
	randomize()

func _on_timer_timeout() -> void:
	var minigame_load = items[randi_range(0,items.size()-1)]
	var minigame_instance: Node2D = minigame_load.instantiate()
	
	minigame_instance.position.x = randi_range(item_spawn_margin, size.x - item_spawn_margin)
	
	add_child(minigame_instance)
