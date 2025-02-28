extends Control

var follower: int = 0

@onready var follower_label = $PanelLabel/Label
@onready var grade_element = get_parent().get_node("Grade")

func _ready() -> void:
	_initialize_follower()

func _initialize_follower() -> void:
	follower_label.text = str(follower)
	EventBus.add_signal("add_follower", add_follower)

func add_follower(arg: int = 1) -> void:
	follower += arg
	follower_label.text = str(follower)
	grade_element.update_grading()
