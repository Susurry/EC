extends Node2D

@export var timeline: String

@onready var cut_anim: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	EventBus.add_signal("play_cutscene", cutscene_play)

func cutscene_play(anim_name: String = ""):
	if anim_name:
		EventBus.emit_signal("block_player_state", true)
		cut_anim.play(anim_name)
	else:
		cut_anim.play()

func cutscene_dialogue(time_cut: String, book_id: int) -> void:
	cut_anim.pause()
	Dialogic.start(time_cut, "book" + str(book_id))

func cutscene_end(_anim_name: StringName) -> void:
	EventBus.emit_signal("block_player_state", false)
	Dialogic.emit_signal("timeline_ended")
