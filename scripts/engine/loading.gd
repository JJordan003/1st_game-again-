extends Node2D

const VIEWPORT_PATH = "/root/control/container/viewport"
var scene

func exportScene(exported_scene):
	scene = exported_scene
	pass	

func clearChildren():
	for child in range(0,get_node(VIEWPORT_PATH).get_child_count()):
		get_node(VIEWPORT_PATH).get_child(0).queue_free()
		pass
	pass

func loading():
	print("LOADING NEXT SCENE: ", scene)
	get_node(VIEWPORT_PATH).add_child(load(scene).instance())
	pass