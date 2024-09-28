extends Node2D  # Se for um nó 2D
var criacao_no_pai = null
func instance_node(node: PackedScene,location: Vector2,parent : Node):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
