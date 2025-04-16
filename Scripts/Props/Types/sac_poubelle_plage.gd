extends PropTalk

@export var sfx_pick_up: AudioStreamWAV
@export var give_item: String

var id: int

func initialize_garbage() -> void:
	if SaveManager.getElement("Missions", "Poubelle_Plage"):
		var poubelle_data: Array[bool] = SaveManager.getElement("Missions", "Poubelle_Plage")
		if poubelle_data[id] == true:
			queue_free()

func on_interact(player: Player) -> void:
	if SaveManager.getElement("Quests", "S_plage") == null: # Quête inactive (pas de sauvegarde)
		super(player)
	elif SaveManager.getElement("Quests", "S_plage") == false: # Quête active
		AudioManager.play_sfx(sfx_pick_up, -5.0)
		EventBus.emit_signal("add_item", give_item)
		
		var poubelle_data: Array[bool] = SaveManager.getElement("Missions", "Poubelle_Plage")
		poubelle_data[id] = true
		SaveManager.setElement("Missions", {"Poubelle_Plage": poubelle_data})
		queue_free()
		
		if not poubelle_data.has(false):
			Dialogic.start("pnj_plage", "book2")
