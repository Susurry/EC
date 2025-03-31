extends Node2D

func _ready() -> void:
	if SaveManager.getElement("Quests", "3_eboueur") == true:
		EventBus.emit_signal("play_cutscene", "supprimer_quete_eboueur")
