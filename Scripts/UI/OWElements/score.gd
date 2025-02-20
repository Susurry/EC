extends Control

var empreinte: int = 0

@onready var empreinte_label = $PanelLabel/Label
@onready var grade_element = get_parent().get_node("Grade")

func _ready() -> void:
	_initialize_empreinte()

func _initialize_empreinte() -> void:
	empreinte_label.text = str(empreinte)
	EventBus.add_signal("set_empreinte", on_update_empreinte)

func on_update_empreinte(arg: int) -> void:
	empreinte += arg
	empreinte_label.text = str(empreinte)
	grade_element.update_grading()
