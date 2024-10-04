extends Node2D
@export  var fcima: PackedScene;
@export  var fbaixo: PackedScene;
var listaAnm;
var lista = []
var cima = []
var baixo = []
var final;
var anm;
var total;
var escolhendo = false

func separa_lista(inteira):
	for i in range(0, inteira.size()):
		if inteira[i][0] == "a":
			lista.append(inteira[i])
		elif inteira[i][0] == "c":
			cima.append(inteira[i])
		elif inteira[i][0] == "b":
			baixo.append(inteira[i])

func _ready() -> void:
	listaAnm = $"Animação".get_animation_list()
	separa_lista(listaAnm)
	anm = 0
	total = lista.size() 

func _process(_delta: float) -> void:
	if $"conversa/Caixa-fundo/botões".visible:
				escolhendo = true 
	if Input.is_action_just_pressed("proximo") and !escolhendo:
		anm += 1
		if anm < total:
			$"Animação".play(lista[anm])
		else:
			if final == "cima":
				get_tree().change_scene_to_packed(fcima)
			else:
				get_tree().change_scene_to_packed(fbaixo)

func _on_cima_pressed() -> void:
	final = "cima"
	lista = cima
	total = lista.size()
	$"conversa/Caixa-fundo/botões".visible = false
	escolhendo = false
	anm = 0
	$"Animação".play(lista[anm])
	
func _on_baixo_pressed() -> void:
	final = "baixo"
	lista = baixo
	total = lista.size()
	$"conversa/Caixa-fundo/botões".visible = false
	escolhendo = false
	anm = 0
	$"Animação".play(lista[anm])
