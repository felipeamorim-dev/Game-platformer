extends KinematicBody2D

const SPEED = 120
const GRAVITY = 20
const JUMP_MAX = 350
const UP = Vector2(0,-1)
var moveDir = Vector2()
var motion = Vector2()
var walking = false
var jumping = false



func inputControl():
	
	var walking_left = Input.is_action_pressed("esquerda")
	var walking_right = Input.is_action_pressed("direita")
	var jump = Input.is_action_pressed("pulo")
	
	moveDir.x = -int(walking_left) + int(walking_right)
	moveDir.y = -int(jump)
	
	if is_move_and_slide_on_floor():
		jumping = false
		if walking_left || walking_right:
			walking = true
		else:
			walking = false
	else:
		walking = false
		jumping = true

func movementControl():
	
	var jump = Input.is_action_pressed("pulo")
	
	motion.y += GRAVITY
	motion.x = moveDir.x * SPEED
	
	if is_move_and_slide_on_floor():
		if jump:
			motion.y = moveDir.y * JUMP_MAX
	
	motion = move_and_slide(motion, UP)


func jump():
	motion.y = - JUMP_MAX


