extends Button

func _pressed():
	loading.exportScene("res://scenes/options/options.tscn")
	loading.clearChildren()
	loading.loading()
	pass