extends Node2D

@export var timeline: String

var shower: bool = false
var bath_full: bool = false

@onready var animated_sprite = $WindowSize/AnimatedSprite2D

func _process(float) -> void:
	if animated_sprite.is_playing() == false && bath_full == true :
			animated_sprite.play("shower")
			shower = true
			bath_full = false
			

func _on_button_pressed(arg: String) -> void:
	if arg == "play_anim":
		if shower == false :
			animated_sprite.play("start_shower")
			bath_full = true
		if shower == true :
			animated_sprite.play("shower_end")
			shower = false
			return


func _on_bouton_quitter_pressed() -> void:
	get_parent().erase_minigame(true)
