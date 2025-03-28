extends Node2D

func _ready() -> void:
	var poubelle_data: Array[bool]
	
	for i in get_children().size():
		get_child(i).id = i
		poubelle_data.append(false)
		
	SaveManager.setElement("Missions", {"Poubelle": poubelle_data})
