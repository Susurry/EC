extends Prop

@export var timeline: String

func on_interact(_player: Player) -> void:
	Dialogic.start(timeline)
