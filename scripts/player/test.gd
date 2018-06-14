extends RigidBody2D

func _process(delta):
	if Input.is_key_pressed(KEY_D):
		linear_velocity.x += 1
	if Input.is_key_pressed(KEY_A):
		linear_velocity.x -= 1
	if Input.is_key_pressed(KEY_SPACE):
		gravity_scale = -20
		print("SPACE")
	
	if gravity_scale < 20:
		gravity_scale += 1
	print(gravity_scale)