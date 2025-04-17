extends Node2D

func _ready() -> void:
	# Pour commencer la mission
	# SaveManager.setElement("Quests", {"S_plage" = false})
	
	if SaveManager.getElement("Missions", "Poubelle_Plage") == null: # Si il y a aucune sauvegarde
		var poubelle_data: Array[bool]
		
		for i in get_children().size():
			get_child(i).id = i
			poubelle_data.append(false)
			
		SaveManager.setElement("Missions", {"Poubelle_Plage": poubelle_data})
	else:
		for i in get_children().size():
			var poubelle: Node2D = get_child(i)
			poubelle.id = i
			poubelle.initialize_garbage()
