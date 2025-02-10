extends InputManager

@onready var knob = $Joystick/Knob
@onready var max_dist = $Joystick.shape.radius
@onready var stick_center: Vector2 = $Joystick.texture_normal.get_size() / 2

var touched: bool = false
var interact_pressed_timer: float

func _process(delta: float) -> void:
	if touched:
		knob.global_position = get_global_mouse_position()
		knob.position = stick_center + (knob.position - stick_center).limit_length(max_dist)
	
	if interact_pressed_timer > 0:
		interact_pressed_timer -= delta

func get_direction() -> Vector2:
	var dir = knob.position - stick_center
	return dir

func is_interacting() -> bool:
	return interact_pressed_timer > 0

func _on_joystick_pressed() -> void:
	touched = true

func _on_joystick_released() -> void:
	touched = false
	knob.position = stick_center

func _on_interact_button_pressed() -> void:
	interact_pressed_timer = 0.1
