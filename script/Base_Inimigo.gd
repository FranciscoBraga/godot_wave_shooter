extends Sprite2D

@export var velocidade: int = 75

var mov = Vector2.ZERO

var atordoado = false

@export var recuo: int = 600

@export var hp: int = 3

var particula_sangue = preload("res://particula_sangue.tscn")

var cor_atual = modulate

func efeito_camera_inimigo():
	if hp <= 0 and Global.criacao_no_pai != null :
		if Global.camera != null:
			Global.camera.tremer_tela(50,0.1)
		sangue_inimigo()
		
func sangue_inimigo():
	Global.pontos += 1
	var instacia_particula_sangue = Global.instance_node(particula_sangue,global_position,Global.criacao_no_pai)
	instacia_particula_sangue.rotation = mov.angle()
	instacia_particula_sangue.modulate = Color.from_hsv(cor_atual.h,1,0.35)
	queue_free()
		
func movimento_basico_inimigo(delta):
	if Global.jogador != null and atordoado == false:
		mov = global_position.direction_to(Global.jogador.global_position)
		global_position += mov * velocidade * delta
	elif atordoado:
		mov = lerp(mov,Vector2.ZERO,0.3)
		global_position += mov  * delta
		
func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("dano") and atordoado == false:
		modulate = Color.WHITE
		area.get_parent().queue_free()
		mov = -mov * recuo
		atordoado = true
		hp -= area.get_parent().dano
		$timer_recuo.start()
		
func _on_timer_recuo_timeout() -> void:
	modulate = cor_atual
	atordoado = false

	
