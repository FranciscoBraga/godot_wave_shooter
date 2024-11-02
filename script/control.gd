extends Control

var tamanho_vidas = 20

func on_mudar_vidas_jogador(vidas_jogador) -> void:
	$vidas.custom_minimum_size = Vector2(vidas_jogador * tamanho_vidas,20)
