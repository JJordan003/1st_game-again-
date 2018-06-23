extends KinematicBody2D

export (int) var SPEED
export (int) var GRAVITY
export (float) var AIR_ACCELERATION
export (int) var MAX_SPEED
export (float) var SLOW_DOWN_SPEED
export (int) var JUMP_HEIGHT
export (int) var MAX_ACCELERATION
export (float) var ACCELERATION_MULTIPLIER 
var debug = false
var velocity = Vector2()
var acceleration = 0.1
var movespeed = Vector2()

func is_colliding(area):
	for body in get_node(area).get_overlapping_bodies().size():
		if get_node(area).get_overlapping_bodies()[body-1] != get_node("."):
			return true
			pass
		pass
	return false
	pass
	
func _physics_process(delta):
	
	if is_colliding("collisions/collision_ground"):
		if Input.is_action_pressed("ui_left"):
			acceleration -= ACCELERATION_MULTIPLIER
			pass #increasing acceleration with pressing binded key
		if Input.is_action_pressed("ui_right"):
			acceleration += ACCELERATION_MULTIPLIER
			pass #increasing acceleration with pressing binded key
		pass #is responsible for accelerating while on the ground
	else:
		if Input.is_action_pressed("ui_left"):
			acceleration -= ACCELERATION_MULTIPLIER * AIR_ACCELERATION
			pass #increasing acceleration with pressing binded key
		if Input.is_action_pressed("ui_right"):
			acceleration += ACCELERATION_MULTIPLIER * AIR_ACCELERATION
			pass #increasing acceleration with pressing binded key
		pass #is responsible for accelerating while in the air
	
	if Input.is_action_just_pressed("player_jump") and is_colliding("collisions/collision_ground"):
		velocity.y = -JUMP_HEIGHT
		pass #jumping
	
	if velocity.y < 20 * GRAVITY and is_colliding("collisions/collision_ground") == false:
		velocity.y += GRAVITY * delta
		pass #gravity / this makes player fall
	
	if !Input.is_action_pressed("player_jump") and is_colliding("collisions/collision_ground"):
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
	velocity.x += acceleration * SPEED
	
	if acceleration > MAX_ACCELERATION:
		acceleration = MAX_ACCELERATION
		pass #limiting acceleration to not have crazy speeds
	if acceleration < -MAX_ACCELERATION:
		acceleration = -MAX_ACCELERATION
		pass #limiting acceleration to not have crazy speeds
	if velocity.x > MAX_SPEED:
		velocity.x = MAX_SPEED
		pass #limiting speed, so that the player wont be able to go crazy high speeds
	if velocity.x < -MAX_SPEED:
		velocity.x = -MAX_SPEED
		pass #limiting speed, so that the player wont be able to go crazy high speeds
	
	if is_colliding("collisions/collision_ground"):
		if !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
			acceleration /= 2
			pass
		if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
			acceleration /= 2
			pass
		pass #is responsible for slowing down player when not accelerating
	if debug == true:
		print("acceleration :",acceleration,", velocity.x: ",velocity.x,", velocity.y: ",velocity.y, is_colliding("collisions/collision_ground"))
		pass #various purposes
	movespeed.x = delta * velocity.x
	movespeed.y = delta * velocity.y
	move_and_collide(movespeed) #putting all the above variables into use 
	velocity.x = 0
	
	if Input.is_action_just_pressed("game_debug"):
		if debug == false:
			debug = true
		else:
			debug == false
	pass
	#dislaimer: i don't remember what and why i wrote all this, if it contains some bugs it'll be an ass to fix so please don't report any thanks
func _process(delta):
	if Input.is_action_just_pressed("editor_spawn"):
		spawn.ent("res://scenes/entities/black_box.tscn")
		pass
	pass