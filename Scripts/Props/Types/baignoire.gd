extends GenericProp

func on_interact(_player: Player) -> void:
	print("moi je suis une baignoire")
	#Temporaire
	Game.ui.update_score(30)
