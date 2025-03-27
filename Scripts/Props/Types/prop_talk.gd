extends Prop

@export var timeline: String
@onready var face_dir: Marker2D = $FacingDirection

func on_interact(player: Player) -> void:
	Dialogic.start(timeline)
	
	await Dialogic.timeline_started
	
	# Modifie la direction du joueur pour faire face au PNJ
	print(face_dir.position)
	var direction: Vector2 = face_dir.global_position - player.position
	player.skin.set_animation_direction(direction)
