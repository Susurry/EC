extends SubViewport

@export var list_minigame :Resource

var minigame_display: PackedScene

@onready var game = get_parent().get_parent().viewport

func _ready() -> void:
	EventBus.add_signal("setup_minigame", setup_minigame)

func setup_minigame(minigame_name: String) -> void:
	var minigame_load = load(list_minigame.dictionnary_minigame[minigame_name])
	var minigame_instance: Node2D = minigame_load.instantiate()
	add_child(minigame_instance)
	get_parent().visible = true
	game.process_mode = Node.PROCESS_MODE_DISABLED
	
func erase_minigame() -> void:
	for n in self.get_children():
		self.remove_child(n)
		n.queue_free()
		
	get_parent().visible = false
	game.process_mode = Node.PROCESS_MODE_INHERIT
	
