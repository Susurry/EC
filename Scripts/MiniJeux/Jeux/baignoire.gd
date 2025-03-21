extends Control

var is_bath_mode: bool = false

@onready var animated_sprite = $SpriteBaignoire
@onready var bouchon_button = $Bouchon
@onready var valve_button = $SpriteBaignoire/ValveDroite
@onready var timer = $Timer
@onready var progress_bar: ProgressBar = $ProgressBar

func shower_start() -> void:
	bouchon_button.visible = false
	animated_sprite.play("start_shower")
	await animated_sprite.animation_finished
	timer.start()

func shower():
	progress_bar.value += 1
	
	if is_bath_mode:
		if progress_bar.value >= 6:
			# Placez la signal de sauvegarde ici
			shower_end()
	else:
		if progress_bar.value >= 6 and progress_bar.value < 12:
			# Placez la signal de sauvegarde ici
			print("score -2") # à remplacer
		elif progress_bar.value >= 12 and progress_bar.value < 18:
			print("score +1") # à remplacer
		elif progress_bar.value >= 18:
			print("score +2") # à remplacer
			shower_end()
			return
		
		valve_button.disabled = false

func shower_end() -> void:
	valve_button.visible = false
	timer.stop()
	animated_sprite.play("shower_end")
	await get_tree().create_timer(2.0).timeout
	get_parent().quit_minigame()

func shower_stop():
	if progress_bar.value >= 6:
		shower_end()
		return

	animated_sprite.play("shower_end")
	await animated_sprite.animation_finished
	timer.stop()
	valve_button.disabled = false

func _on_button_pressed() -> void:
	valve_button.disabled = true
	if timer.is_stopped():
		shower_start()
	else:
		shower_stop()

func _on_bouchon_pressed() -> void:
	is_bath_mode = !is_bath_mode
