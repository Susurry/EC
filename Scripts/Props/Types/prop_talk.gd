extends Prop

@export var timeline: String

func on_interact(player: Player) -> void:
	# Modifie la direction du joueur pour faire face au PNJ
	var direction: Vector2 = position - player.position
	player.skin.set_animation_direction(direction)
	
	Dialogic.start(timeline)
	
