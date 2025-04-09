extends VBoxContainer

@onready var label1 = $PanelLabel
@onready var label2 = $TimerBarIndicateur

func _on_mouse_entered() -> void:
	label1.visible = true
	label2.visible = false

func _on_mouse_exited() -> void:
	label1.visible = false
	label2.visible = true
