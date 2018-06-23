extends Camera2D

func _ready():
	set_process(true)
	pass

func _process():
	print("x")
	if Input.is_action_pressed("ui_left"):
		position.x -= 1
		pass
	if Input.is_action_pressed("ui_right"):
		position.x += 1
		pass
	if Input.is_action_pressed("ui_up"):
		position.y -= 1
		pass
	if Input.is_action_pressed("ui_down"):
		position.y += 1
		pass
	
	if Input.is_action_just_pressed("scroll_up"):
		zoom *= 1.5
		pass
	if Input.is_action_just_pressed("scroll_down"):
		zoom /= 1.5
		pass