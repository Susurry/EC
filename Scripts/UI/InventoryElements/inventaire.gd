extends PanelContainer

@export var item_display: PackedScene 
@export var list_item: Resource

var item_list: Array[String] = []

@onready var item_column: VBoxContainer = $MarginContainer/VBoxContainer

func _ready() -> void:
	_initialize_signals()
	_initialize_inventaire()

func _initialize_signals() -> void:
	EventBus.add_signal("add_item", add_item)
	EventBus.add_signal("remove_item", remove_item)
	EventBus.add_signal("clear_items", clear_items)

func _initialize_inventaire() -> void:
	visible = check_amount()
	_save_inventory() # Sauvegarde inventaire vide pour qu'il y ai quelque chose à vérifier

func add_item(item_name: String) -> void:
	var item_load: Control = item_display.instantiate()
	item_load.name = item_name
	item_load.get_node("MarginContainer/TextureRect").texture = load(list_item.dictionnaire[item_name])
	
	item_column.add_child(item_load)
	
	item_list.append(item_name)
	visible = check_amount()
	
	_save_inventory()

func remove_item(item_name: String) -> void:
	for i in item_list.size():
		if item_list[i] == item_name:
			item_column.get_node(item_name).queue_free()
			
			item_list.remove_at(i)
			visible = check_amount()
			
			_save_inventory()
			return

func check_amount() -> bool:
	if item_list.size() == 0:
		return false
	return true

func clear_items() -> void:
	for i in item_column.get_children():
		i.queue_free()
	
	item_list.clear()
	visible = false
	
	_save_inventory()

func _save_inventory() -> void:
	SaveManager.setElement("Player", {"inventory": item_list})
