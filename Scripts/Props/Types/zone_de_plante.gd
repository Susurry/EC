extends PropTalk

@onready var id: int = get_index()

func on_interact(player: Player) -> void:
	var plant_data: Array[bool] = SaveManager.getElement("Missions", "Plante_Park")
	if plant_data[id] == true:
		return
	
	if SaveManager.getElement("Quests", "S_plante") == null: # Quête inactive (pas de sauvegarde)
		super(player)
	elif SaveManager.getElement("Quests", "S_plante") == false: # Quête active
		print("A plant has been planted")
		
		plant_data[id] = true
		SaveManager.setElement("Missions", {"Plante_Park": plant_data})
		
		if not plant_data.has(false):
			print("DESTROY THE SEEDS")
