extends Control


func _on_cima_pressed() -> void:
	Globais.informacao = true

func _on_baixo_pressed() -> void:
	Globais.informacao = false
