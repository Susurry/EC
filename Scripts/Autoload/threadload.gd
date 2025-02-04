extends Node2D

@export var maps: Resource
@export var loading_screen: PackedScene

var viewport: SubViewport

func initialize_viewport(game_viewport: SubViewport) -> void:
	viewport = game_viewport

func load_scene(next_scene: String, pos_id: int = 0, transition_type: String = "") -> void:
	_erase_scenes()
	
	# Créer la scène de chargement
	var loading_instance: Node2D = loading_screen.instantiate()
	loading_instance.transition_key = transition_type # Envoie le type de transition pour le chargement
	viewport.call_deferred("add_child", loading_instance)
	
	ResourceLoader.load_threaded_request(maps.locations[next_scene], "", true)
	
	var progress: Array = []
	while true:
		match ResourceLoader.load_threaded_get_status(maps.locations[next_scene], progress):
			0:
				print("Error, invalid scene")
				return
			3:
				var scene: Node2D = ResourceLoader.load_threaded_get(maps.locations[next_scene]).instantiate()
				
				# Pour éviter les problèmes si on une scène sans joueur (ex: menu, leaderboard)
				if scene is Map:
					scene.start_id = pos_id
				
				loading_instance.next_scene = scene
				return

func trigger_next_scene(target_scene: Node2D) -> void:
	_erase_scenes()
	viewport.call_deferred("add_child", target_scene)

func _erase_scenes() -> void:
	# Supprime les scènes contenu dans le viewport (écran de chargement, scène précédente)
	for prev_scene in viewport.get_children():
		prev_scene.queue_free()
