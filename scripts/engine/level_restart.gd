extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_reset"):
		loading.fullload("res://scenes/level.tscn")
		pass
	
	if Input.is_action_just_pressed("game_spawn"):
		print("SPAWNED at: ",get_global_mouse_position())
		get_node("level").add_child(load("res://scenes/entities/black_box.tscn").instance())
		get_node("level").get_child(get_node("level").get_child_count()-1).position = get_local_mouse_position()
	pass

func _ready():
	loading.exportScene("res://scenes/player.tscn")
	loading.loading()
	pass