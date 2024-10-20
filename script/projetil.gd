extends Sprite2D

var mov = Vector2(1,0)
var velocidade = 250
var dir_unica = true

var dano
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dir_unica:
		look_at(get_global_mouse_position())
		dir_unica = false
	global_position += mov.rotated(rotation) * velocidade * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
