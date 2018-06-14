extends Button
var r1920 = Vector2(1920,1080)
var s1920 = Vector2(1,1)
func _ready():
	pass
func _pressed():
	get_node("/root/control/container").set_scale(s1920)
	#OS.set_window_fullscreen(true) włącza fullscreen
	#OS.set_borderless_window(value) usuwa border
	if OS.is_window_fullscreen(true):
		get_node("/root").set_size(r1920)
	else:
		OS.set_window_size(r1920)
	pass