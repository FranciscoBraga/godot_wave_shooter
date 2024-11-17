extends Node2D  # Se for um nó 2D
var criacao_no_pai = null
var jogador = null
var pontos = 0
var record = 0
var camera = null
var textura_dano = null
var recorde = 0

var path = "user://jogasalvo.save"

func instance_node(node: PackedScene,location: Vector2,parent : Node):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
func salvar():
	var dic_salvar ={
		"record":record
	}
	return dic_salvar
	
func salvar_jogo():
	var jogo_salvo = FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE,'@42@FOB@')
	var record_salvar = salvar()
	var json_data = JSON.stringify(record_salvar)
	jogo_salvo.store_line(json_data)
	jogo_salvo.close()
	
func carregar_jogo():
	var dados = 0
	if not FileAccess.file_exists(path):
		return
	var jogo_salvo = FileAccess.open_encrypted_with_pass(path,FileAccess.READ, '@42@FOB@')
	var record_jogo_salva = jogo_salvo.get_line()
	var json = JSON.new()
	var error = json.parse(record_jogo_salva)
	if error == OK:
		dados = json.data
		
	record = dados["record"]
	jogo_salvo.close()
	
