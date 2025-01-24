extends Prop

func on_interact(_player: Player) -> void:
	print("moi je suis une baignoire")
	#Temporaire
	Game.ui.update_score(30)
	ThreadLoad.load_scene(Game.level_container, "Debug2")
