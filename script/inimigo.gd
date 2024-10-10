extends Sprite2D

var velocidade = 75
var mov = Vector2.ZERO
var atordoado = false
var recuo = 6
var hp = 3

var particula_sangue = preload("res://particula_sangue.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.jogador != null and atordoado == false:
		mov = global_position.direction_to(Global.jogador.global_position)
	elif atordoado:
		mov = lerp(mov,Vector2.ZERO,0.3)
		
	global_position += mov *velocidade * delta
	
	if hp <= 0 and Global.criacao_no_pai != null :
		if Global.camera != null:
			Global.camera.tremer_tela(50,0.1)
		Global.pontos += 1
		var instacia_particula_sangue = Global.instance_node(particula_sangue,global_position,Global.criacao_no_pai)
		instacia_particula_sangue.rotation = mov.angle()
		queue_free()

func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("dano") and atordoado == false:
		modulate = Color.WHITE
		area.get_parent().queue_free()
		mov = -mov * recuo
		atordoado = true
		hp -= 1
		$timer_recuo.start()
		

func _on_timer_recuo_timeout() -> void:
	modulate = Color("d71d24")
	atordoado = false
