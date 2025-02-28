extends SubViewport

@export var list_minigame: Resource
@export var button: Button

func _ready() -> void:
	EventBus.add_signal("setup_minigame", setup_minigame)

func setup_minigame(minigame_name: String) -> void:
	# A REVOIR
	var minigame_load = load(list_minigame.dictionnary_minigame[minigame_name])
	var minigame_instance: Node2D = minigame_load.instantiate()
	get_parent().custom_minimum_size =  minigame_instance.window_size
	button.position = (Vector2(1920,1080) / 2 - get_parent().custom_minimum_size/2)-Vector2(60,5)
	add_child(minigame_instance)
	get_parent().get_parent().get_parent().visible = true
	EventBus.emit_signal("minigame_toggle", true)
	
func erase_minigame(force_end: bool = false) -> void:
	for n in get_children():
		n.queue_free()
		
	get_parent().get_parent().get_parent().visible = false
	EventBus.emit_signal("minigame_toggle", false)

	if force_end:
		Dialogic.emit_signal("timeline_ended")

func _on_button_pressed() -> void:
	erase_minigame(true)
