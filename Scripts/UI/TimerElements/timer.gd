extends Control

@export var heure : int
@export var minute : int
@export var seconde : int
@export var time_multi : float = 1.0
@export_group("Setup")

@export var carbone_element: Control
@export var follower_element: Control

var time : float
var format_string = "%02d : %02d : %02d"
var tween: Tween
var is_tweening: bool

@onready var timer_bar: ProgressBar = $Bars/TimeBar
@onready var changing_timer_bar: ProgressBar = $Bars/TimeBar/ChangeTimeBar
@onready var time_label = $Labels/Time
@onready var time_multi_label = $Labels/TimerBarIndicateur

func _ready() -> void:
	_initialize_timer()
	_initialize_signals()

func _initialize_timer() -> void:
	time_label.text = format_string % [heure, minute, seconde] # Affiche le temps en format HH : MM : SS
	time = (heure * 3600) + (minute * 60) + seconde # Calcul du temps initial en secs
	changing_timer_bar.visible = false

func _initialize_signals() -> void:
	EventBus.add_signal("change_time", change_time)

func _process(delta: float) -> void:
	if time > 0:
		time -= delta * time_multi
		heure = int(time / 3600)
		minute = int(time / 60) % 60
		seconde = int(time) % 60
		time_label.text = format_string % [heure, minute, seconde]
		
		if not is_tweening:
			timer_bar.value = -time
	else:
		pass

func update_grading() -> void:
	var grading_score: float = carbone_element.empreinte - floor(follower_element.follower/4)
	match grading_score:
		var x when x >= 18:
			time_multi = 1.5
			time_multi_label.text = ">>>>>"
		var x when x < 18 and x >= 15:
			time_multi = 1.5
			time_multi_label.text = ">>>>>"
		var x when x < 15 and x >= 12:
			time_multi = 1.2
			time_multi_label.text = ">>>>"
		var x when x < 12 and x >= 9:
			time_multi = 1
			time_multi_label.text = ">>>"
		var x when x < 9 and x >= 6:
			time_multi = 0.8571
			time_multi_label.text = ">>"
		var x when x < 6 and x > 2 :
			time_multi = 0.75
			time_multi_label.text = ">"
		var x when x <= 2:
			time_multi =  0.75
			time_multi_label.text = ">"

func change_time(var_time: float) -> void:
	is_tweening = true
	time += var_time
	
	if var_time < 0:
		changing_timer_bar.visible = true
		changing_timer_bar.value = -time
	
	# Animation de la bar de temps / thermomètre
	tween = create_tween()
	tween.connect("finished", tween.kill)
	tween.tween_property(timer_bar, "value", -time, 0.5)
	
	await tween.finished
	
	is_tweening = false
	changing_timer_bar.visible = false

func _on_button_pressed() -> void:
	change_time(1000.0)
