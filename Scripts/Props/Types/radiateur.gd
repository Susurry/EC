extends Prop

var as_interacted: bool = false

func on_interact(_player: Player) -> void:
	if !as_interacted:
		Dialogic.start("dial_test", "book1")
		as_interacted = true;
	else:
		Dialogic.start("dial_test", "book2")
