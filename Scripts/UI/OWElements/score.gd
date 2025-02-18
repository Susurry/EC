extends Control

var empreinte: int = 0

@onready var empreinte_label = $PanelLabel/Label
@onready var grade_element = get_parent().get_node("Grade")

func _ready() -> void:
	empreinte_label.text = str(empreinte)

func on_update_empreinte(arg: int) -> void:
	empreinte += arg
	empreinte_label.text = str(empreinte)
	grade_element.update_grading()
