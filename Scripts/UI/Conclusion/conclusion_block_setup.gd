extends Control

@export var block_scene: PackedScene
@export var block_data: GradeBlockList

@export var target: Control

func _ready() -> void:
	SaveManager.setElement("Mission", {"exist_test": true})
	SaveManager.setElement("Mission", {"exist_test2": true})
	
	SaveManager.setElement("Points", {"test": 1})
	SaveManager.setElement("Points", {"test2": 50})
	
	for i in block_data.blocks.keys():
		var new_block_data: Resource = load(block_data.blocks[i])
		var new_block: PanelContainer = block_scene.instantiate()
		var save_mission: Variant = SaveManager.getElement(new_block_data.mission_key_1, new_block_data.mission_key_2)
		
		if not save_mission:
			continue
		
		new_block.get_node("VBoxContainer/Label").text = new_block_data.title
		var save_score: float = SaveManager.getElement(new_block_data.point_key_1, new_block_data.point_key_2)
		new_block.get_node("VBoxContainer/Label2").text = str(save_score)
		new_block.get_node("VBoxContainer/Label3").text = new_block_data.description
		
		target.add_child(new_block)
