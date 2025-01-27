extends Control

@onready var ver_button = $Versioning

func _ready() -> void:
	ver_button.text = ProjectSettings.get_setting("application/config/version")

func _on_button_pressed() -> void:
	DisplayServer.clipboard_set(ProjectSettings.get_setting("application/config/version"))
