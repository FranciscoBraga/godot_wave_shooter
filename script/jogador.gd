extends Sprite2D

var velocidade = 150
var mov = Vector2.ZERO

var projetil = preload("res://script/projetil.tscn")

var recarregado = true

var morto = false

func _ready() -> void:
	Global.jogador = self
	
	
func _enter_tree() -> void:
	Global.jogador = null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mov.x = int(Input.is_action_pressed("direita")) - int(Input.is_action_pressed("esquerda"))
	mov.y = int(Input.is_action_pressed("baixo")) - int(Input.is_action_pressed("cima"))
	
	global_position.x = clamp(global_position.x,24,616)
	global_position.y = clamp(global_position.y,24,336)
	
	if morto == false:
		global_position += velocidade * mov * delta
	
	
	
	if Input.is_action_pressed("atirar") and Global.criacao_no_pai != null  and  recarregado and morto == false:
		Global.instance_node(projetil,global_position, Global.criacao_no_pai)
		recarregado = false
		$tempo_recarga.start()

func _on_tempo_recarga_timeout() -> void:
	recarregado = true
	
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("inimigo"):
		visible = false
		morto = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
	
