extends Node2D
var level_tree

func ent(ent):
	#ent = lokalizacja sceny na dysku
	var operating_node = get_node(level_tree).get_child(0)
	var spawn_position = Vector2()
	var mouse_position = Vector2()
	mouse_position.x = operating_node.get_local_mouse_position().x+32
	mouse_position.y = operating_node.get_local_mouse_position().y+32
	
	operating_node.add_child(load(ent).instance())
	
	while spawn_position.x < mouse_position.x:
		spawn_position.x += 64
		pass
	while spawn_position.x > mouse_position.x:
		spawn_position.x -= 64
		pass
	
	while spawn_position.y < mouse_position.y:
		spawn_position.y += 64
		pass
	while spawn_position.y > mouse_position.y:
		spawn_position.y -= 64
		pass
	
	print("GLOBAL MOUSE POSITION:",get_global_mouse_position())
	print("LOCAL MOUSE POSITION :",operating_node.get_local_mouse_position())
	print("MOUSE POSITION       :",mouse_position)
	print("ATTEMPTING TO SPAWN ENTITY AT: ",spawn_position)
	
	operating_node.get_child(operating_node.get_child_count()-1).position = spawn_position
	pass