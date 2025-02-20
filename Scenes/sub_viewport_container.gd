extends SubViewportContainer

func _ready() -> void:
	get_tree().root.size_changed.connect(resize) 

func resize():
	size = get_viewport_rect().size
