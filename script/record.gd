extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(Global.record)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.pontos > Global.record:
		Global.record = Global.pontos
