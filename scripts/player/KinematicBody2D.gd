extends KinematicBody2D

onready var ray_down_left = get_node("player_down_left")
onready var ray_down_right = get_node("player_down_right")
onready var ray_right_up = get_node("player_right_up")
onready var ray_right_down = get_node("player_right_down")
onready var ray_left_up = get_node("player_left_up")
onready var ray_left_down = get_node("player_left_down")
export (int) var SPEED
export (int) var GRAVITY
export (float) var AIR_ACCELERATION
export (int) var MAX_SPEED
export (int) var SLOW_DOWN_SPEED
export (int) var JUMP_HEIGHT
var ray
var velocity = Vector2()
var acceleration = 0
var movespeed = Vector2()

func _process(delta):
	if ray_down_left.is_colliding() == true or ray_down_right.is_colliding() == true:
		ray = true
		pass
	else:
		ray = false
		pass
	
	if ray == true:
		if Input.is_action_pressed("ui_left"):
			acceleration -= 1
			pass
		if Input.is_action_pressed("ui_right"):
			acceleration += 1
			pass
		pass
	else:
		if Input.is_action_pressed("ui_left"):
			acceleration -= 1 * AIR_ACCELERATION
			pass
		if Input.is_action_pressed("ui_right"):
			acceleration += 1 * AIR_ACCELERATION
			pass
		pass
		
	if !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
		acceleration = 0
		pass
	
	if Input.is_action_pressed("player_jump") and ray == true:
		velocity.y = -JUMP_HEIGHT
		pass
	
	if velocity.y < 20 * GRAVITY:
		velocity.y += GRAVITY * delta
		pass
	if velocity.y > 20 * GRAVITY:
		velocity.y = 20 * GRAVITY
		pass
		
	if !Input.is_action_pressed("player_jump") and ray == true:
		velocity.y = 0
		pass
	
	if ray_right_up.is_colliding()or ray_right_down.is_colliding() or ray_left_up.is_colliding() or ray_left_down.is_colliding():
		acceleration = 0
		pass
	
	velocity.x  += acceleration * SPEED
	if velocity.x > MAX_SPEED:
		velocity.x = MAX_SPEED
		pass
	
	if velocity.x > 0 and acceleration == 0:
		velocity.x -= SLOW_DOWN_SPEED * SPEED
		pass
	if velocity.x < 0 and acceleration == 0:
		velocity.x += SLOW_DOWN_SPEED * SPEED
		pass
	
	movespeed.x = delta * velocity.x
	movespeed.y = delta * velocity.y
	move_and_collide(movespeed)
	velocity.x = 0
	pass
	#dislaimer: i don't remember what and why i wrote all this, if it contains some bugs it'll be ass to fix so please don't report any thanks