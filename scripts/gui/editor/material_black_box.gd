extends Button

func _pressed():
	get_node("/root/control/container/scene_editor").entity = "res://scenes/entities/black_box.tscn"
	pass