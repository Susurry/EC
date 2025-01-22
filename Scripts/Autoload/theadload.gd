extends Node

var maps: Resource = preload("uid://byrvrkqe18ml0")

func load_scene(viewport: Node, next_scene: String):
	
	# Supprime les éléments de la scene précédente
	for prev_scene in viewport.get_children():
		prev_scene.queue_free()
	
	ResourceLoader.load_threaded_request(maps.locations[next_scene], "", true)
	
	var progress: Array = []
	while true:
		match ResourceLoader.load_threaded_get_status(maps.locations[next_scene], progress):
			0:
				print("Error, invalid scene")
				return
			3:
				var scene = ResourceLoader.load_threaded_get(maps.locations[next_scene]).instantiate()
				viewport.call_deferred("add_child", scene)
				return
