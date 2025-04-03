extends Control

@export var heure : int
@export var minute : int
@export var seconde : int
@export var time_multi : float = 1.0

var time : float
var format_string = "%02d : %02d : %02d"
var tween: Tween

@onready var time_label = $PanelLabel/Label
@onready var timer_bar = $BarreTemps/PanelProgressBar/TimeBar
@onready var changing_timer_bar = $BarreTemps/PanelProgressBar/TimeBar/ChangeTimeBar

func _ready() -> void:
	_initialize_timer()
	_initialize_signals()

func _initialize_timer() -> void:
	time_label.text = format_string % [heure, minute, seconde]
	time = (heure * 3600) + (minute * 60) + seconde
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
		
		timer_bar.value = -time
	else:
		pass

func change_time(var_time: float) -> void:
	time += var_time

func _on_button_pressed() -> void:
	change_time(1000.0)
