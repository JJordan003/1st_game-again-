extends Node2D

const VIEWPORT_PATH = "/root/control/container/viewport"
var scene
var path

func exportScene(exported_scene):
	scene = exported_scene
	pass	

func clearChildren():
	for child in range(0,get_node(VIEWPORT_PATH).get_child_count()):
		get_node(VIEWPORT_PATH).get_child(child).queue_free()
		print(child, get_node(VIEWPORT_PATH).get_child(0))
		pass
	pass

func loading():
	get_node(VIEWPORT_PATH).add_child(load(scene).instance())
	pass

func fullload(exported_scene):
	exportScene(exported_scene)
	clearChildren()
	loading()
	pass