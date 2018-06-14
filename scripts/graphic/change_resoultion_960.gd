extends Button
var r960 = Vector2(960,540)
var s960 = Vector2(0.28125,0.28125)
func _ready():
	pass
func _pressed():
	if OS.is_window_fullscreen():
		get_node("/root/control/container").set_scale(s960)
		get_node("/root").set_size(r960)
	else:
		OS.set_window_size(r960)
	pass