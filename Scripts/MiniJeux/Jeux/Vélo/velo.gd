extends Control

var actions_needed: int = 0
var actions_completed: int = 0

func _ready() -> void:
	_initialize_anchors()
	_initialize_panels()

func _initialize_anchors() -> void:
	for i in $Anchors.get_children():
		if i.piece_is_on == false:
			actions_needed += 1
		if i.is_fixed == false:
			actions_needed += 1

func _initialize_panels() -> void:
	for i in $PanelPieces.get_children():
		i.minigame_window = self
		i.initialize_piece()
	for i in $PanelOutils.get_children():
		i.minigame_window = self
		i.initialize_outil()

func add_action() -> void:
	actions_completed += 1
	if actions_completed >= actions_needed:
		await get_tree().create_timer(2.0).timeout
		get_parent().quit_minigame()
