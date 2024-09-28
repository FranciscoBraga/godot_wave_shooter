extends Node2D

 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.criacao_no_pai = self

func _exit_tree() -> void:
	Global.criacao_no_pai =  null
