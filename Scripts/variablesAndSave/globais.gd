extends Node
const save = "user://variable.save"
var informacao;
var ficarMaisTempo;
var finais = {
	"mendiga" : false,
	"mendiga2" : false,
	"encalhada" : false,
	"velho" : false,
	"desaparece" : false,
	"empresaria" : false,
	"presa" : false,
	"gay" : false,
	"luta" : false,
	"vendida" : false,
	"vende" : false
}

func get_infor():
	if FileAccess.file_exists(save):
		var file = FileAccess.open(save, FileAccess.READ)
		finais = file.get_var()

func set_infor():
	var file = FileAccess.open(save, FileAccess.WRITE)
	file.store_var(finais)
