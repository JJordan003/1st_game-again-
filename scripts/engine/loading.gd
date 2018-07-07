extends Node2D

var scene
var path

func exportScene(exported_scene):
	scene = exported_scene
	pass	

func clearChildren():
	for child in range(0,get_node(global.INTPATH_VIEWPORT).get_child_count()):
		get_node(global.INTPATH_VIEWPORT).get_child(child).queue_free()
		pass
	pass

func loading():
	get_node(global.INTPATH_VIEWPORT).add_child(load(scene).instance())
	pass

func fullload(exported_scene):
	exportScene(exported_scene)
	clearChildren()
	loading()
	pass