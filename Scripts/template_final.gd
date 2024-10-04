extends Node2D
@export var nome : String
var listaAnm;
var lista = []
var anm;
var total;

func _ready() -> void:
	Globais.finais[nome] = true
	Globais.set_infor()
	listaAnm = $"Animação".get_animation_list()
	for i in range(0, listaAnm.size()):
		if listaAnm[i][0] == "a":
			lista.append(listaAnm[i])
	anm = 0
	total = lista.size() 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("proximo"):
		anm += 1
		if anm < total:
			$"Animação".play(lista[anm])
		else:
			get_tree().change_scene_to_file("res://Cenas/menu.tscn")
