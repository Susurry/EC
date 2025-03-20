extends Control

var shower_completed: bool = false
var bouchon_on: bool = false
var stop: bool = false

@onready var animated_sprite = $SpriteBaignoire
@onready var sprite_bouchon = $Bouchon
@onready var valve = $SpriteBaignoire/ValveDroite

@onready var timer = $Timer
@onready var bar: ProgressBar = $ProgressBar
var shower_paused: bool = true

func shower_start() -> void:
	sprite_bouchon.visible = false
	animated_sprite.play("start_shower")
	await animated_sprite.animation_finished
	shower_paused = false
	timer.start()

func shower():
	bar.value += 1
	
	if bouchon_on:
		if bar.value >= 6:
			shower_end()
	else:
		if bar.value >= 6 and bar.value < 12:
			print("score -2")
		elif bar.value >= 12 and bar.value < 18:
			print("score +1")
		elif bar.value >= 18:
			print("score +2")
			shower_end()
			return
		
		valve.disabled = false

func shower_end() -> void:
	timer.stop()
	valve.disabled = true
	animated_sprite.play("shower_end")
	await get_tree().create_timer(2.0).timeout
	print("Fin")
	#get_parent().quit_minigame()

func shower_stop():
	if bar.value >= 6:
		shower_end()
		return

	animated_sprite.play("shower_end")
	await animated_sprite.animation_finished
	shower_paused = true
	timer.stop()
	valve.disabled = false

func _on_button_pressed() -> void:
	valve.disabled = true
	if shower_paused:
		shower_start()
	else:
		shower_stop()

func _on_bouchon_pressed() -> void:
	bouchon_on = !bouchon_on
