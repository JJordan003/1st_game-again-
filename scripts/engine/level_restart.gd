extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_reset"):
		loading.fullload("res://scenes/level.tscn")
		spawn.history = []
		pass
	pass

func _ready():
	spawn.level_tree = get_path()
	loading.exportScene("res://scenes/player.tscn")
	loading.loading()
	pass