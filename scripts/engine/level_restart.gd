extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_reset"):
		loading.exportScene("res://scenes/level.tscn")
		loading.clearChildren()
		loading.loading()
		pass
	pass