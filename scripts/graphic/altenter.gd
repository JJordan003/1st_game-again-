extends Viewport

func _process(delta):
	if Input.is_action_just_pressed("ui_screentype"):
		if OS.is_window_fullscreen():
			OS.set_window_fullscreen(false)
		else:
			OS.set_window_fullscreen(true)
		pass