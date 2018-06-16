extends ViewportContainer

func _ready():
	loading.exportScene("res://scenes/mainmenu.tscn")
	loading.loading()
	pass
