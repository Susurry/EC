extends ColorRect

var tween: Tween

func trigger_fade(target: float, duration: float, order: int = 1) -> void:
	z_index = order
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_property(self, "modulate:a", target, duration)
