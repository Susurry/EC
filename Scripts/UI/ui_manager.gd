extends Control

@onready var carbone_element: Control = $OWElements/Rows/Carbone
@onready var debug_element: Control = $DebugElements
@onready var pause_element: Control = $PauseElements

func _ready() -> void:
	initialize_debug_tools()

func initialize_debug_tools() -> void:
	if !OS.is_debug_build():
		debug_element.queue_free()

func update_empreinte(arg: int) -> void:
	carbone_element.on_update_empreinte(arg)
