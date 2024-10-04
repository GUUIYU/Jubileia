extends Node2D

func _ready() -> void:
	Globais.get_infor()
	$quadro/finais/mendiga.visible = Globais.finais["mendiga"]
	$quadro/finais/mendiga2.visible = Globais.finais["mendiga2"]
	$quadro/finais/encalhada.visible = Globais.finais["encalhada"]
	$quadro/finais/velho.visible = Globais.finais["velho"]
	$quadro/finais/empresaria.visible = Globais.finais["empresaria"]
	$quadro/finais/desaparece.visible = Globais.finais["desaparece"]
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/caminhos/Chegada.tscn")

func _on_créditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()
