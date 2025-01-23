extends Node2D
class_name GenericProp

signal onInteract

@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D

func onGenericPropInteract():
	animatedSprite.material.set_shader_parameter("width",1.0)
	
func _onGenericPropLeave():
	animatedSprite.material.set_shader_parameter("width",0)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.get_class() == "Player"):
		body.propsAround.append(self)
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.get_class() == "Player"):
		body.propsAround.erase(self)
