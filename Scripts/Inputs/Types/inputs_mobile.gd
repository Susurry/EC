extends InputManager

const MOVE_DEADZONE: float = 10
const SPRINT_DEADZONE: float = 110
const INTERACT_COOLDOWN: float = 1

@onready var knob: Sprite2D = $MarginContainer/Control/Joystick/Knob
@onready var max_dist: float = $MarginContainer/Control/Joystick.shape.radius
@onready var stick_center: Vector2 = $MarginContainer/Control/Joystick.texture_normal.get_size() / 2

var touched: bool = false
var interact_pressed: bool
var interact_cooldown: float

func _ready() -> void:
	initialize_signals()

func initialize_signals() -> void:
	Dialogic.timeline_ended.connect(onTimelineEnded)

func _process(delta: float) -> void:
	if touched:
		knob.global_position = get_global_mouse_position()
		knob.position = stick_center + (knob.position - stick_center).limit_length(max_dist)
	
	if interact_cooldown > 0:
		interact_cooldown -= delta

func get_direction() -> Vector2:
	var dir: Vector2 = Vector2.ZERO
	
	if stick_center.distance_to(knob.position) > MOVE_DEADZONE:
		dir = knob.position - stick_center
	
	return dir

func is_sprinting() -> bool:
	var sprint: bool = false
	
	# Sprint, si le joueur tire le stick en dehors de la dead zone
	if stick_center.distance_to(knob.position) > SPRINT_DEADZONE:
		sprint = true
	
	return sprint

func is_interacting() -> bool:
	var result: bool = interact_pressed
	interact_pressed = false
	
	return result

func onTimelineEnded() -> void:
	interact_cooldown = INTERACT_COOLDOWN

func _on_joystick_pressed() -> void:
	touched = true

func _on_joystick_released() -> void:
	touched = false
	knob.position = stick_center

func _on_interact_button_pressed() -> void:
	if !Dialogic.current_timeline && interact_cooldown <= 0:
		interact_pressed = true
	else:
		interact_pressed = false
