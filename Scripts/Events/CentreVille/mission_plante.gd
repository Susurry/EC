extends Node2D

func _ready() -> void:
	# Pour commencer la mission
	# SaveManager.setElement("Quests", {"S_plante" = false})
	
	if SaveManager.getElement("Missions", "Plante_Park") == null: # Si il y a aucune sauvegarde
		var plant_data: Array[bool]
		
		for i in get_children().size():
			plant_data.append(false)
			
		SaveManager.setElement("Missions", {"Plante_Park": plant_data})
