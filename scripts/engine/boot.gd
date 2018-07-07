extends Control

func _ready():
	OS.set_window_title("Project " + global.VERSION)
	loading.fullload(global.EXTPATH_MAINMENU)
	pass
func _process(delta):
	if Input.is_action_just_pressed("ui_esc"):
		loading.fullload(global.EXTPATH_MAINMENU)
		pass
