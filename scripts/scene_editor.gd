extends Container

onready var camera = get_node("camera")
onready var gui = get_node("GUI/gui/gui_info")
var entity = "res://scenes/entities/black_box.tscn"

#vars for future level loading:
var player_spawnpos
var player_scale
#to be done in future

func _ready():
	spawn.level_tree = get_node("level").get_path()
	ui_updatezoom()
	ui_updateamount()
	ui_updateentity()
	set_process(true)
	pass

func _process(delta):
	#ENGINE:
	#MOVEMENT AND ZOOM
	if Input.is_action_pressed("game_left"):
		camera.position.x -= 5 * camera.zoom.x
		pass
	if Input.is_action_pressed("game_right"):
		camera.position.x += 5 * camera.zoom.x
		pass
	if Input.is_action_pressed("game_up"):
		camera.position.y -= 5 * camera.zoom.y
		pass
	if Input.is_action_pressed("game_down"):
		camera.position.y += 5 * camera.zoom.y
		pass
	if Input.is_action_just_pressed("editor_zoomout"):
		camera.zoom *= 2
		ui_updatezoom()
		pass
	if Input.is_action_just_pressed("editor_zoomin"):
		camera.zoom /= 2
		ui_updatezoom()
		pass
	#ENTITY PLACEMENT
	if Input.is_action_pressed("editor_spawn"):
		if entity != null:
			spawn.ent(entity)
			pass
		ui_updateamount()
		pass
	if Input.is_action_pressed("editor_despawn"):
		spawn.despawn()
		ui_updateamount()
		pass
	pass
	
	#GUI:
	#MOUSE_POSITION
	gui.get_node("mouse").text = "Mouse position: "
	gui.get_node("mouse").add_text(str(get_global_mouse_position()))
	#CURRENT_ENTITY
	ui_updateentity()
	pass

func ui_updatezoom():
	gui.get_node("zoom").text = "Zoom: "
	gui.get_node("zoom").add_text(str(camera.zoom))
	pass

func ui_updateamount():
	gui.get_node("amount").text = "Amount of entities: "
	gui.get_node("amount").add_text(str(get_node("level").get_child_count()))

func ui_updateentity():
	if entity == null:
		gui.get_node("entity").text = "Selected entity: NONE"
		pass
	else:
		gui.get_node("entity").text = "Selected entity: "
		gui.get_node("entity").add_text(entity)
		pass
	pass