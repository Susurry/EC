extends Control

@export var category_label: PackedScene
@export var mission_block: PackedScene
@export var empty_block: PackedScene
@export var block_data: GradeBlockList
@export var target: Control
@export var category_order: Array[String]

var summary_content: Dictionary[String,Array]

func _ready() -> void:
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
	for category in category_order:
		var category_size: int = 0
		var new_category: Label = category_label.instantiate()
		new_category.text = category
		
		target.add_child(new_category)
		
		for summary in summary_content[category]:
			var save_mission: Variant = SaveManager.getElement(summary.mission_key_1, summary.mission_key_2)
			if save_mission == null:
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
			
			if category == "Followers":
				var type_text: Label = new_summary.get_node(new_summary.get_meta("type_path"))
				type_text.text = "F"
				
				score_text.text = str(int(save_score))
				# score positif vert, negatif rouge
				if save_score > 0:
					score_text.text = "+" + score_text.text
					score_text.label_settings.font_color = Color.GREEN
				else:
					score_text.label_settings.font_color = Color(0.427,0.427,0.427)
			else:
				score_text.text = str(save_score)
				# score positif rouge, negatif vert (EcoScore réduire empreinte)
				if save_score > 0:
					score_text.text = "+" + score_text.text
					score_text.label_settings.font_color = Color.RED
				elif save_score < 0:
					score_text.label_settings.font_color = Color.GREEN
			
			target.add_child(new_summary)
			category_size += 1
		
		if category_size == 0:
			var new_empty: PanelContainer = empty_block.instantiate()
			target.add_child(new_empty)
