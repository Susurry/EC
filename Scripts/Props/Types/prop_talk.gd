extends Prop

@export var timeline: String

func on_interact(player: Player) -> void:
	Dialogic.start(timeline)
	
	await Dialogic.timeline_started
	
	# Modifie la direction du joueur pour faire face au PNJ
	var direction: Vector2 = position - player.position
	player.skin.set_animation_direction(direction)
