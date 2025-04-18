extends PropTalk

var plant_sprite_region: Rect2 = Rect2(148,58,16,17)

@onready var id: int = get_index()

func initialize_plant() -> void:
	var plant_data: Array[bool] = SaveManager.getElement("Missions", "Plante_Park")
	if plant_data[id] == true:
		sprite.texture.region = plant_sprite_region

func on_interact(player: Player) -> void:
	var plant_data: Array[bool] = SaveManager.getElement("Missions", "Plante_Park")
	if plant_data[id] == true:
		Dialogic.start("quest_plante", "book2")
		return
	
	if SaveManager.getElement("Quests", "S_jardinier") == null: # Quête inactive (pas de sauvegarde)
		super(player)
	elif SaveManager.getElement("Quests", "S_jardinier") == false: # Quête active
		print("A plant has been planted")
		Dialogic.start("quest_plante", "book3")
		plant_data[id] = true
		sprite.texture.region = plant_sprite_region
		
		SaveManager.setElement("Missions", {"Plante_Park": plant_data})
		
		if not plant_data.has(false):
			await Dialogic.timeline_ended
			Dialogic.start("quest_plante", "book4")
