extends Button
func _ready():
	pass
func _pressed():
	if OS.is_window_fullscreen():
		OS.set_window_minimized(true)
	else:
		OS.set_window_fullscreen(true)
	pass