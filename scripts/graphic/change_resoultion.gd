extends Button

func _ready():

	pass
func _pressed():
	get_node("/root/control/container").scale.x = 1
	get_node("/root/control/container").scale.y = 1
	pass