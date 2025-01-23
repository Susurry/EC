extends Node2D
class_name GenericProp

@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D

func onGenericPropInteract() -> void:
	animatedSprite.material.set_shader_parameter("width",1.0)
	
func _onGenericPropLeave() -> void:
	animatedSprite.material.set_shader_parameter("width",0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "Player"):
		body.props_around.append(self)
		onGenericPropInteract()
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.name == "Player"):
		body.props_around.erase(self)
		_onGenericPropLeave() 

func on_interact(_player: Player):
	pass
