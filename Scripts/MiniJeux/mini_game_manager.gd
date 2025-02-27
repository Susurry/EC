extends SubViewport

@export var list_minigame: Resource
@export var game_viewport: SubViewport

func _ready() -> void:
	EventBus.add_signal("setup_minigame", setup_minigame)

func setup_minigame(minigame_name: String) -> void:
	var minigame_load = load(list_minigame.dictionnary_minigame[minigame_name])
	var minigame_instance: Node2D = minigame_load.instantiate()
	add_child(minigame_instance)
	get_parent().visible = true
	EventBus.emit_signal("minigame_toggle", true)
	
func erase_minigame() -> void:
	for n in get_children():
		n.queue_free()
		
	get_parent().visible = false
	EventBus.emit_signal("minigame_toggle", false)
