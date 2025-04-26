extends Control

@export var category_label: PackedScene
@export var mission_block: PackedScene
@export var block_data: GradeBlockList
@export var target: Control

var summary_content: Dictionary[String,Array]

func _ready() -> void:
	SaveManager.setElement("Mission", {"exist_test": true})
	SaveManager.setElement("Mission", {"exist_test2": true})
	SaveManager.setElement("Points", {"test": 1})
	SaveManager.setElement("Points", {"test2": 50})
	
	_initialize_categories()
	_initialize_content()

func _initialize_categories() -> void:
	var block_data_list: Array
	for data in block_data.blocks:
		block_data_list.append(load(block_data.blocks[data]))
	
	# setup category list
	for block in block_data_list:
		summary_content[block.category] = []
	
	# load shit into dictionnary
	for block in block_data_list:
		for category in summary_content:
			if block.category == category:
				summary_content[category].append(block)

func _initialize_content() -> void:
	for category in summary_content:
		var new_category: Label = category_label.instantiate()
		new_category.text = category
		target.add_child(new_category)
		
		for summary in summary_content[category]:
			var save_mission: Variant = SaveManager.getElement(summary.mission_key_1, summary.mission_key_2)	
			if not save_mission:
				continue # Si la mission n'est pas faite skip
			
			var save_score: float = 0.0
			if SaveManager.getElement(summary.point_key_1, summary.point_key_2):
				save_score = SaveManager.getElement(summary.point_key_1, summary.point_key_2)
			
			var new_summary: PanelContainer = mission_block.instantiate()
			var summary_label: Label = new_summary.get_node(new_summary.get_meta("topic_path"))
			var desc_text: RichTextLabel = new_summary.get_node(new_summary.get_meta("desc_path"))
			var source_text: RichTextLabel = new_summary.get_node(new_summary.get_meta("source_path"))
			var score_text: Label = new_summary.get_node(new_summary.get_meta("score_path"))
			
			summary_label.text = summary.title
			desc_text.text = summary.description
			source_text.text = summary.description_scientifique
			score_text.text = str(save_score)
			
			target.add_child(new_summary)
