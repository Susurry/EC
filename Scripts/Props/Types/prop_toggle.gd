extends Prop

var as_interacted: bool = false

@export var timeline: String

func on_interact(_player: Player) -> void:
	if !as_interacted:
		Dialogic.start(timeline, "book1")
		as_interacted = true;
	else:
		Dialogic.start(timeline, "book2")
