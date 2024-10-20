extends Camera2D

var intesidade_tremor_camera = 0

var iniciar_tremor_camera = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.camera = self

func _exit_tree() -> void:
	Global.camera = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	zoom = lerp(zoom, Vector2(1,1),0.3)
	
	if iniciar_tremor_camera  == true:
		global_position += Vector2(randi_range(-intesidade_tremor_camera, intesidade_tremor_camera),
		randi_range(-intesidade_tremor_camera, intesidade_tremor_camera)) * delta

func tremer_tela(intesidade, tempo):
	zoom = Vector2(1,1) + Vector2(intesidade * 0.02, intesidade * 0.02)
	intesidade_tremor_camera = intesidade
	$timer_camera.wait_time = tempo
	$timer_camera.start()
	iniciar_tremor_camera = true
	

func _on_timer_camera_timeout() -> void:
	iniciar_tremor_camera = false
