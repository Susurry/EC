extends Control

var shower: bool = false
var bath_full: bool = false

@onready var animated_sprite = $SpriteBaignoire

func _process(_delta: float) -> void:
	if animated_sprite.is_playing() == false && bath_full == true :
			animated_sprite.play("shower")
			shower = true
			bath_full = false

func _on_button_pressed() -> void:
	if shower == false :
		animated_sprite.play("start_shower")
		bath_full = true
	if shower == true :
		animated_sprite.play("shower_end")
		shower = false
