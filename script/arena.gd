extends Node2D

@export var inimigos: Array[PackedScene]
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.criacao_no_pai = self
	Global.pontos = 0

func _exit_tree() -> void:
	Global.criacao_no_pai =  null

func _on_timer_spawn_inimigo_timeout() -> void:
	
	var posicao_inimigo = Vector2(randi_range(-160,670),randi_range(-90,390))

	while posicao_inimigo.x < 640 and posicao_inimigo.x > -80 and posicao_inimigo.y < 360 and posicao_inimigo.y > -45:
		posicao_inimigo = Vector2(randi_range(-160,670),randi_range(-90,360))
		
	var numero_inimigos = round(randi_range(0,inimigos.size() -1)) 
	print(numero_inimigos)
	Global.instance_node(inimigos[numero_inimigos],posicao_inimigo,self)


func _on_timer_dificuldade_timeout() -> void:
	if $timer_spawn_inimigo.wait_time > 0.50:
		$timer_spawn_inimigo.wait_time -= 0.025
