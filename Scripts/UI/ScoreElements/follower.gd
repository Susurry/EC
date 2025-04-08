extends Control

@export var sfx_follow: AudioStreamWAV
@export var time_element: Control

var follower: int = 0

@onready var follower_label: Label = $PanelLabel/Label
@onready var grade_element: Control = get_parent().get_node("Grade")
@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	_initialize_follower()

func _initialize_follower() -> void:
	follower_label.text = str(follower)
	EventBus.add_signal("add_follower", add_follower)

func add_follower(arg: int = 1) -> void:
	AudioManager.play_sfx(sfx_follow, -5.0)
	
	anim_player.play("feedback_good")
	follower += arg
	follower_label.text = str(follower)
	grade_element.update_grading()
	time_element.change_time(180)
