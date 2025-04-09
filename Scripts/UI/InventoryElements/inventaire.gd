extends GridContainer

@export var item_display: PackedScene 
@export var list_item: Resource

var item_list: Array[String] = []

func _ready() -> void:
	_initialize_inventaire()

func _initialize_inventaire() -> void:
	EventBus.add_signal("add_item", add_item)
	EventBus.add_signal("remove_item", remove_item)
	EventBus.add_signal("clear_items", clear_items)
	_save_inventory() # Sauvegarde inventaire vide pour qu'il y ai quelque chose à vérifier

func add_item(item_name: String) -> void:
	var item_load: Control = item_display.instantiate()
	item_load.name = find_new_name(item_name)
	item_load.get_node("PanelContainer/TextureRect").texture = load(list_item.dictionnaire[item_name])
	
	add_child(item_load)
	
	item_list.append(item_name)
	_save_inventory()

func find_new_name(item_name: String) -> String:
	for i in range(1, get_child_count() + 1):
		var new_name: String = str(item_name, i)
		if not has_node(new_name):
			return new_name
	return item_name

func remove_item(item_name: String) -> void:
	for i in item_list.size():
		if item_list[i] == item_name:
			get_node(item_name).queue_free()
			
			item_list.remove_at(i)
			_save_inventory()
			return

func clear_items() -> void:
	for i in get_children():
		i.queue_free()
	
	item_list.clear()
	_save_inventory()

func _save_inventory() -> void:
	SaveManager.setElement("Player", {"inventory": item_list})
