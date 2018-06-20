extends ViewportContainer

func _ready():
	OS.set_window_title("XD")
	loading.fullload("res://scenes/mainmenu.tscn")
	pass
