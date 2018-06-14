extends Button
var r1280 = Vector2(1280,720)
var s1280 = Vector2(0.6666,0.6666)
func _ready():
	pass
func _pressed():
	if OS.is_window_fullscreen():
		get_node("/root/control/container").set_scale(s1280)
		get_node("/root").set_size(r1280)
	else:
		OS.set_window_size(r1280)
	pass