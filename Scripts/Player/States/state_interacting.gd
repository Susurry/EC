extends PlayerState

func _ready() -> void:
	Dialogic.timeline_ended.connect(onTimelineEnded)

func animate(player: Player, _delta: float) -> void:
	player.skin.set_animation_state(PlayerSkin.ANIMATION_STATES.idle)

func onTimelineEnded() -> void:
	get_parent().change_state("Regular")
