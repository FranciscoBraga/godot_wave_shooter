extends Node2D

var inimigo_1 = preload("res://inimigo.tscn")
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.criacao_no_pai = self

func _exit_tree() -> void:
	Global.criacao_no_pai =  null

func _on_timer_spawn_inimigo_timeout() -> void:
	print("inimigo")
	var posicao_inimigo = Vector2(randi_range(-160,670),randi_range(-90,390))
	
	while posicao_inimigo.x < 640 and posicao_inimigo.x > -80 and posicao_inimigo.y < 360 and posicao_inimigo.y > -45:
		posicao_inimigo = Vector2(randi_range(-160,670),randi_range(-90,360))
		
		Global.instance_node(inimigo_1,posicao_inimigo,self)
