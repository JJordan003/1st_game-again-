extends Button
var r1366 = Vector2(1366,768)
var s1366 = Vector2(0.711458,0.711458)
func _ready():
	pass
func _pressed():
	if OS.is_window_fullscreen():
		get_node("/root/control/container").set_scale(s1366)
		get_node("/root").set_size(r1366)
	else:
		OS.set_window_size(r1366)
	pass