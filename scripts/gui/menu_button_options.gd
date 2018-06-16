extends Button

func _pressed():
	loading.exportScene("res://scenes/options.tscn")
	loading.clearChildren()
	loading.loading()
	pass