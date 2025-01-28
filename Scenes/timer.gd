extends Control


@export var heure : int
@export var minute : int
@export var seconde : int
@export var time_multi : float = 1.0

var time : float
var format_string = "%02d : %02d : %02d"

@onready var time_label = $Time


func _ready() -> void:
	time_label.text = format_string % [heure, minute, seconde]
	time = (heure * 3600) + (minute * 60) + seconde
	print(time)

func _process(delta: float) -> void:
	if time > 0:
		time -= delta * time_multi
		heure = int(time / 3600)
		minute = int(time / 60) % 60
		seconde = int(time) % 60
		time_label.text = format_string % [heure, minute, seconde]
	else:
		print("It just work")
