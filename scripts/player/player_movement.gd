extends KinematicBody2D

export (int) var SPEED
export (int) var GRAVITY
export (float) var AIR_ACCELERATION
export (int) var MAX_SPEED
export (float) var SLOW_DOWN_SPEED
export (int) var JUMP_HEIGHT
var debug = false
var velocity = Vector2()
var acceleration = 0
var movespeed = Vector2()

func is_colliding(area):
	if get_node(area).get_overlapping_bodies().size() != 0:
		if get_node(area).get_overlapping_bodies()[0] != get_node("."):
			return true
			pass
		else:
			return false
		pass
	if get_node(area).get_overlapping_bodies().size() == 0:
		return false
		pass
	pass
	
func _process(delta):
	#
	#MOVEMENT:
	#
	if Input.is_action_pressed("ui_left"):
		acceleration -= 1
		pass #increasing acceleration with pressing binded key
	if Input.is_action_pressed("ui_right"):
		acceleration += 1
		pass #increasing acceleration with pressing binded key
	
	if acceleration > 0:
		acceleration -= SLOW_DOWN_SPEED/100
		pass #slowing down when acceleration is positive
	if acceleration < 0:
		acceleration += SLOW_DOWN_SPEED/100
		pass #slowing down when acceleration is negative
	
	if Input.is_action_pressed("player_jump") and is_colliding("collisions/collision_ground") == true:
		velocity.y = -JUMP_HEIGHT
		pass #jumping
	
	if velocity.y < 20 * GRAVITY and is_colliding("collisions/collision_ground") == false:
		velocity.y += GRAVITY * delta
		pass #gravity / this makes player fall
	
	if !Input.is_action_pressed("player_jump") and is_colliding("collisions/collision_ground") == true:
		velocity.y = 0
		pass #stopping gravity when on surface
	
	if is_colliding("collisions/collision_top") and velocity.y < 0:
		velocity.y = 0
		pass #should stop getting player stuck when jumping mario style
	
	if is_colliding("collisions/collision_left") and acceleration < 0:
		acceleration = 0
		pass #detects if there is a collision on left side of player and reduces acceleration preventing from being stuck in a wall
	elif is_colliding("collisions/collision_right") and acceleration > 0:
		acceleration = 0
		pass #detects if there is a collision on right side of player and reduces acceleration preventing from being stuck in a wall
	velocity.x = velocity.x + (acceleration * SPEED)
	
	if velocity.x > MAX_SPEED:
		velocity.x = MAX_SPEED
		pass #limiting speed, so that the player wont be able to go crazy high speeds
	if velocity.x < -MAX_SPEED:
		velocity.x = -MAX_SPEED
		pass #limiting speed, so that the player wont be able to go crazy high speeds
		
	movespeed.x = delta * velocity.x
	movespeed.y = delta * velocity.y
	move_and_collide(movespeed) #putting all the above variables into use 
	velocity.x = 0
	pass
	#dislaimer: i don't remember what and why i wrote all this, if it contains some bugs it'll be an ass to fix so please don't report any thanks