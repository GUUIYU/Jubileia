extends Sprite2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("voltar"):
		get_tree().change_scene_to_file("res://Cenas/menu.tscn")
