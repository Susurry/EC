extends Prop

func on_interact(player: Player) -> void:
	player.state_machine.change_state("Interacting")
	print("je suis un radiateur :D")
