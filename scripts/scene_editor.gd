extends Container

onready var camera = get_node("camera")

func _ready():
	set_process(true)
	pass

func _process():
	print("x")
	if Input.is_action_pressed("ui_left"):
		camera.position.x -= 1
		pass
	if Input.is_action_pressed("ui_right"):
		camera.position.x += 1
		pass
	if Input.is_action_pressed("ui_up"):
		camera.position.y -= 1
		pass
	if Input.is_action_pressed("ui_down"):
		camera.position.y += 1
		pass
	
	if Input.is_action_just_pressed("scroll_up"):
		camera.zoom *= 1.5
		pass
	if Input.is_action_just_pressed("scroll_down"):
		camera.zoom /= 1.5
		pass