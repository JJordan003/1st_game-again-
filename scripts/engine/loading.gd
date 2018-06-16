extends Node2D

const VIEWPORT_PATH = "/root/control/container/viewport"
var scene

func exportScene(exported_scene):
	scene = exported_scene
	pass

func loading():
	print("LOADING NEXT SCENE: ", scene)
	get_node(VIEWPORT_PATH).add_child(load(scene).instance())
	pass
	
func clearChildren():
	print("***\nCALLED CLEARCHILDREN FUNCTION:\nCHILDREN OF VIEWPORT COUNT: ", get_node(VIEWPORT_PATH).get_child_count(),"\nLIST OF CHILDREN: ", get_node(VIEWPORT_PATH).get_children())
	print(get_node(VIEWPORT_PATH).get_child(0))
	get_tree().get_node(VIEWPORT_PATH).remove_child(get_child(0))
	
#	for child in range(0,get_node(VIEWPORT_PATH).get_child_count()):
#		print(get_node(VIEWPORT_PATH).get_children())
#		get_node(VIEWPORT_PATH).remove_child(get_child(0)) #nie usuwa dzieciaka viewporta, dalej jest rysowany w tle
#		pass

	print("\nFINISH CLEARCHILDREN FUNCTION:\nCHILDREN OF VIEWPORT COUNT: ", get_node(VIEWPORT_PATH).get_child_count(),"\nLIST OF CHILDREN: ", get_node(VIEWPORT_PATH).get_children(),"\n***")
	pass