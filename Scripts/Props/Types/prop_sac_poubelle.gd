extends PropTalk

var id: int

func on_interact(player: Player) -> void:
	var poubelle_data: Array[bool] = SaveManager.getElement("Missions", "Poubelle")
	poubelle_data[id] = true
	SaveManager.setElement("Missions", {"poubelle": poubelle_data})
	print(poubelle_data)
	super(player)
	await Dialogic.timeline_ended
	queue_free()
