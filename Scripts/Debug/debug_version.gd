extends Control

var dictionnaire : Dictionary = {
	0 : "Debug",
	1 : "Debug2"
	}
	
var current_map : String = "Debug"

@onready var ver_button = $Versioning
@onready var line_edit = $LineEdit

func _ready() -> void:
	ver_button.text = ProjectSettings.get_setting("application/config/version")

func _on_button_pressed() -> void:
	DisplayServer.clipboard_set(ProjectSettings.get_setting("application/config/version"))


func _on_option_button_item_selected(index: int) -> void:
	ThreadLoad.load_scene(Game.level_container, dictionnaire[index], 0)
	current_map = dictionnaire[index]


func _on_line_edit_text_submitted(new_score: String) -> void:
	Game.ui.update_score(int(new_score))
	line_edit.text = ""


func _on_respawn_debug_item_selected(index: int) -> void:
	ThreadLoad.load_scene(Game.level_container, current_map, index)
