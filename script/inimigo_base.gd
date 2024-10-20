extends "res://script/Base_Inimigo.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movimento_basico_inimigo(delta)
	efeito_camera_inimigo() 
	
