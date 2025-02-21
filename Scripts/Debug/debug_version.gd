extends Control

var dictionnaire : Dictionary = {
	0 : "Debug",
	1 : "Debug2",
	2 : "Appartement"
}

var current_map : String = "Debug"

@onready var ver_button = $Rows/Versioning
@onready var line_edit = $Rows/LineEdit

func _ready() -> void:
	initialize_debug_tools()
	intialize_versionning()

func initialize_debug_tools() -> void:
	if !OS.is_debug_build():
		queue_free()

func intialize_versionning() -> void:
	ver_button.text = ProjectSettings.get_setting("application/config/version")

# VERSIONNING BUTTON
func _on_button_pressed() -> void:
	DisplayServer.clipboard_set(ProjectSettings.get_setting("application/config/version"))

# SCORE MODIFIER
func _on_line_edit_text_submitted(new_score: String) -> void:
	EventBus.emit_signal("set_empreinte", float(new_score))
	line_edit.text = ""

# SCENE TELEPORTER
func _on_option_button_item_selected(index: int) -> void:
	ThreadLoad.load_scene(dictionnaire[index])
	current_map = dictionnaire[index]

func _on_respawn_debug_item_selected(index: int) -> void:
	ThreadLoad.load_scene(current_map, index)
