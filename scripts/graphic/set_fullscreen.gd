extends Button

func _pressed():
	if OS.is_window_fullscreen():
		OS.set_window_fullscreen(false)
	else:
		OS.set_window_fullscreen(true)
	pass