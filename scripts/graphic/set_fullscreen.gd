extends Button
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _pressed():
	print(OS.get_window_size())
	if OS.is_window_fullscreen():
		OS.set_window_minimized(true)
	else:
		OS.set_window_fullscreen(true)
	pass