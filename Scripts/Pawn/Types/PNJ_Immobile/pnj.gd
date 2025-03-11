extends Pawn
class_name PNJ

@export var timeline: String

var as_interacted: bool = false

@onready var sprite: Node2D = $Skin

func set_movement_target(movement_target: Vector2):
	state_machine.change_state("Pathfinding")
	navigationAgent.target_position = movement_target

func _on_navigation_agent_2d_navigation_finished() -> void:
	state_machine.change_state("Regular")

func on_interact(player: Player) -> void:
	var direction: Vector2 = position - player.position
	player.skin.set_animation_direction(direction)
	skin.set_animation_direction(-direction)
	
	if !as_interacted:
		Dialogic.start(timeline, "book1")
		as_interacted = true;
	else:
		Dialogic.start(timeline, "book2")

func draw_outline() -> void:
	sprite.material.set_shader_parameter("width",1.0)

func erase_outline() -> void:
	sprite.material.set_shader_parameter("width",0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.props_around.append(self)
		draw_outline()
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		body.props_around.erase(self)
		erase_outline() 
