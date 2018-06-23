extends Node2D
var level_tree
var history = []

func ent(ent): #spawns entity at mouse position
	#ent = lokalizacja sceny na dysku
	var operating_node = get_node(level_tree)
	var spawn_position = Vector2()
	var mouse_position = Vector2()
	mouse_position.x = operating_node.get_local_mouse_position().x+32
	mouse_position.y = operating_node.get_local_mouse_position().y+32
	
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
	
	if exists(spawn_position): #if something exists at given position
		pass
	else: #if nothing exists at given position
		operating_node.add_child(load(ent).instance())
		operating_node.get_child(operating_node.get_child_count()-1).position = spawn_position
		history.push_front(spawn_position)
		pass
	pass

func despawn():
	var operating_node = get_node(level_tree)
	var despawn_position = Vector2()
	var mouse_position = Vector2()
	var debug_counter = 0
	mouse_position.x = operating_node.get_local_mouse_position().x+32
	mouse_position.y = operating_node.get_local_mouse_position().y+32
	
	while despawn_position.x < mouse_position.x:
		despawn_position.x += 64
		pass
	while despawn_position.x > mouse_position.x:
		despawn_position.x -= 64
		pass

	while despawn_position.y < mouse_position.y:
		despawn_position.y += 64
		pass
	while despawn_position.y > mouse_position.y:
		despawn_position.y -= 64
		pass
	
	if exists(despawn_position): #if something exists at given position
		for child in operating_node.get_children():
			if child.position == despawn_position:
				child.queue_free()
				return
				pass
			pass
		var array_counter = 0
		history.remove(history.find_last(despawn_position))
		pass
	pass #very inefficient code when operating on large numbers of entities 

func exists(pos): #checks if entity exists at given position
#	print(pos,"\n",history)
	for index in history:
		if pos == index:
			return true
			pass
		pass
	pass
	return false
	pass