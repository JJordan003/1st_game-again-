extends Button
var r1600 = Vector2(1600,900)
var s1600 = Vector2(0.8333,0.8333)
func _ready():
	pass
func _pressed():
	if OS.is_window_fullscreen():
		get_node("/root/control/container").set_scale(s1600)
		get_node("/root").set_size(r1600)
	else:
		OS.set_window_size(r1600)
	pass