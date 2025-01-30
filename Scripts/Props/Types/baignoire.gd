extends Prop

@export var dathing: String

func on_interact(_player: Player) -> void:
	Dialogic.start(dathing)
