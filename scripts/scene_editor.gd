extends Container

onready var camera = get_node("camera")
var entity = "res://scenes/entities/black_box.tscn"

func _ready():
	spawn.level_tree = get_child(0).get_path()
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
		camera.zoom *= 1.5
		pass
	if Input.is_action_just_pressed("editor_zoomin"):
		camera.zoom /= 1.5
		pass
	#ENTITY PLACEMENT
	if Input.is_action_pressed("editor_spawn"):
		spawn.ent(entity)
		pass
	if Input.is_action_pressed("editor_despawn"):
		spawn.despawn()
		pass
	pass
	
	#GUI:
	#MOUSE_POSITION
	get_node("camera/gui_info/mouse_position").bbcode_text = str(get_global_mouse_position())