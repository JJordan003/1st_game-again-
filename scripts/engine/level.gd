extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_reset"):
		loading.fullload(global.EXTPATH_LEVEL1)
		pass
	pass

func _ready():
	global.OBJECT_LEVEL = self
	loading.exportScene(global.EXTPATH_PLAYER)
	loading.loading()
	pass