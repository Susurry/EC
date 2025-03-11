extends Prop

var is_siting: bool = false

@export var enter_offset: Vector2
@export var exit_offset: Vector2

@onready var collision = $Collision/CollisionShape2D

func on_interact(player: Player) -> void:
	if !is_siting:
		player.state_machine.change_state("Sitting")
		player.z_index = 2
		player.position = position + enter_offset
		collision.disabled = true
		is_siting = true
	else:
		player.z_index = 0
		player.position = position + exit_offset
		player.state_machine.change_state("Regular")
		collision.disabled = false
		is_siting = false
