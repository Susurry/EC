extends Button

const SPEED: int = 400

@export_enum("Recyclable", "Non Recyclable", "Verre") var type: int
@export var select_offset: int

var click_offset: Vector2
var is_inside_other: bool = false
var pen_dir: float = 1
var screen_limit: float
var curr_pos_y: float = position.y

@onready var minigame_window: Control = get_parent()
@onready var coll_area: Area2D = $PushBackArea

func _ready() -> void:
	screen_limit = minigame_window.size.x - size.x # Taille de la fenêtre moins la taille du bouton
	curr_pos_y = position.y

func _physics_process(delta: float) -> void:
	if button_pressed:
		global_position.x = get_global_mouse_position().x - click_offset.x
	
	if is_inside_other:
		position.x += pen_dir * SPEED * delta
	
	global_position.x = clamp(global_position.x, 0 , screen_limit)

func _on_interact() -> void:
	click_offset = get_global_mouse_position() - global_position
	
	# Lorsque le click est enfoncé désactive la zone de détéction / relaché active la zone de détéction
	coll_area.monitoring = !button_pressed
	coll_area.set_collision_layer_value(1,!button_pressed)
	
	if button_pressed:
		position.y = curr_pos_y - select_offset
		# Pour que la poubelle sélectionner soit toujours au-dessus
		minigame_window.z_index_tracker += 1
		z_index = minigame_window.z_index_tracker
	else:
		position.y = curr_pos_y

func _on_collision_other(area: Area2D, inside: bool) -> void:
	is_inside_other = inside
	if is_inside_other:
		if coll_area.global_position.x > area.global_position.x:
			pen_dir = 1
		elif coll_area.global_position.x < area.global_position.x:
			pen_dir = -1
		else:
			area.get_parent().pen_dir = -pen_dir # Si les deux poubelles occupes la même position
	else:
		# Remet à la valeur de base seulement lorsque les poubelles sont séparées
		minigame_window.z_index_tracker = 0
		z_index = 0

func _on_trash_enter(area: Area2D) -> void:
	area.monitoring = false
	if type == area.get_parent().type:
		minigame_window.update_score(-0.05)
	else:
		minigame_window.update_score(0.05)
	area.get_parent().queue_free()
