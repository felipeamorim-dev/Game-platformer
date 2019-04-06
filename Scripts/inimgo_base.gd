extends KinematicBody2D

const GRAVITY = 20
const SPEED = 20
const UP = Vector2(0,-1)
var direction = -1
var velocity = Vector2()
var death = false

func move_inimigo():
	if !death:
		velocity.y += GRAVITY
		velocity.x = SPEED * direction
		velocity = move_and_slide(velocity, UP)
	else:
		dead()

func dead():
	velocity = Vector2(0, 0)
	velocity = move_and_slide(velocity, UP)
	

