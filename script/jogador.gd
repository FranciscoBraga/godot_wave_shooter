extends Sprite2D

var velocidade = 150
var mov = Vector2.ZERO

var projetil = preload("res://script/projetil.tscn")

var recarregado = true
var tempo_recarga = 0.1
var padrao_tempo_recarga = tempo_recarga
var dano = 1
var dano_padrao = dano

var reset_poder = []

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
		var instacia_projetil = Global.instance_node(projetil,global_position, Global.criacao_no_pai)
		instacia_projetil.dano = dano
		recarregado = false
		$tempo_recarga.start()

func _on_tempo_recarga_timeout() -> void:
	recarregado = true
	$tempo_recarga.wait_time = tempo_recarga
	
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("inimigo"):
		visible = false
		morto = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
	
func _on_tempo_recarga_cooldown_timeout() -> void:
	if reset_poder.find("tempo_recarga") != null:
		tempo_recarga = padrao_tempo_recarga
		reset_poder.erase("tempo_recarga")
	if reset_poder.find("dano") != null:
		tempo_recarga = padrao_tempo_recarga
		reset_poder.erase("dano")
