extends Control

func _ready():
	OS.set_window_title("XD")
	loading.fullload("res://scenes/mainmenu.tscn")
	pass
func _process(delta):
	if Input.is_action_just_pressed("ui_esc"):
		loading.fullload("res://scenes/mainmenu.tscn")
		pass
