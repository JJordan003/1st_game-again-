extends ViewportContainer

func _ready():
	get_node("/root/control/container/viewport").add_child(preload("res://scenes/mainmenu.tscn")) #nie wiem jak to robiles, zmeczony dzisiaj jestem i nie nadaje sie do tego XD
#	get_node("/control/container/viewport").get_child(0).free()
	pass
