extends Node2D

var fade = false

var alpha = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if fade:
		alpha = lerp(alpha, 0.0, 0.1)
		modulate.a = alpha
	if alpha < 0.005:
		queue_free()
	

func _on_timer_fade_timeout() -> void:
	fade = true
