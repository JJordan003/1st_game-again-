extends Button
const r1 = "res://scenes/options/options_video.tscn"
const r2 = "res://scenes/options/options_audio.tscn"
const r3 = "res://scenes/options/options_controls.tscn"
const b1 = "/root/control/container/scene_options/bar/options/video"
const b2 = "/root/control/container/scene_options/bar/options/audio"
const b3 = "/root/control/container/scene_options/bar/options/controls"
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
func _pressed():
	if get_node("/root/control/container/scene_options/container_options").get_child_count() == 2:
		get_node("/root/control/container/scene_options/container_options").get_child(1).queue_free()
	if get_node("/root/control/container/scene_options/container_options").is_visible() == false:
		get_node("/root/control/container/scene_options/container_options").show()
	if get_path() == b1:
		get_node("/root/control/container/scene_options/container_options").add_child(load(r1).instance())
	if get_path() == b2:
		get_node("/root/control/container/scene_options/container_options").add_child(load(r2).instance())
	if get_path() == b3:
		get_node("/root/control/container/scene_options/container_options").add_child(load(r3).instance())
	pass