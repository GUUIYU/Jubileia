extends Node2D
@export  var fcima: PackedScene;
@export  var fbaixo: PackedScene;
var listaAnm;
var lista = []
var cima = []
var baixo = []
var final = 0;
var anm;
var pergunta = 0
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
			if final > 0:
				get_tree().change_scene_to_packed(fcima)
			else:
				get_tree().change_scene_to_packed(fbaixo)

func _on_cima_pressed() -> void:
	lista.insert(anm+1, cima[pergunta])
	pergunta+=1
	final+=1
	anm+=1
	total = lista.size() 
	$"conversa/Caixa-fundo/botões".visible = false
	escolhendo = false
	$"Animação".play(lista[anm])
	
func _on_baixo_pressed() -> void:
	lista.insert(anm+1, baixo[pergunta])
	pergunta+=1
	final-=1
	anm+=1
	total = lista.size() 
	$"conversa/Caixa-fundo/botões".visible = false
	escolhendo = false
	$"Animação".play(lista[anm])
