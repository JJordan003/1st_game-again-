extends Button
const r1 = "res://scenes/options_misc/options_video.tscn"
const b1 = "/root/control/container/options/margin/margin/split/left/video"
const b2 = "/root/control/container/options/margin/margin/split/left/audio"
const b3 = "/root/control/container/options/margin/margin/split/left/controls"
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
func _pressed():
	if get_path() == b1:
		get_node("/root/control/container/options/margin/margin/split").add_child(load(r1).instance())
	if get_path() == b2:
		print("Audio")
	if get_path() == b3:
		print("controls")
	pass