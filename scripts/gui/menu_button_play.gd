extends Button

func _pressed():
	loading.exportScene("res://scenes/level.tscn")
	loading.clearChildren()
	loading.loading()
	loading.clearChildren()
	pass