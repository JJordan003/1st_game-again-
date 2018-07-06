extends Button

func _pressed():
	get_node("/root/control/container/scene_editor").entity = "res://scenes/entities/white_box.tscn"
	pass