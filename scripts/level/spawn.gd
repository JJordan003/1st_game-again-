extends Node2D
var level_tree
var history = []

func ent(ent): #spawns entity at mouse position
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

	print("\n***\nMOUSE POSITION       :",mouse_position)
	print("ATTEMPTING TO SPAWN ENTITY AT: ",spawn_position)
	if exists(spawn_position): #if something exists at given position
		print("SOMETHING EXISTS THERE ALREADY!")
		pass
	else: #if nothing exists at given position
		print("SPAWNED ",ent," AT: ", spawn_position)
		operating_node.get_child(operating_node.get_child_count()-1).position = spawn_position
		history.push_front(spawn_position)
		pass
	pass

func exists(pos): #checks if entity exists at given position
	print(pos,"\n",history)
	for index in history:
		if pos == index:
			return true
			pass
		pass
	pass
	return false
	pass