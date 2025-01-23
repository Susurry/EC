extends SubViewport
class_name LevelContainer

static var inst

func _ready() -> void:
	assert(inst == null)
	inst = self
