extends "res://Scripts/control.gd"

onready var raycast = get_node("raycast")
var anim = ""
var newAnim = ""
var is_dead = false
var dano = 1
var is_on_floor = false
var collision_plat = false

func _ready():
	add_to_group(game.TYPE_PLAYER)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if is_dead == false:
		change_plat_mov()
		inputControl()
		movementControl()
		change_floor()
		flip_h()
		set_animation()
		
		if get_pos().y > 260:
			is_dead = true
	else:
		dead()

func flip_h():
	
	var walking_left = Input.is_action_pressed("esquerda")
	var walking_right = Input.is_action_pressed("direita")
	
	if walking_left:
		get_node("sprite").set_flip_h(true)
	if walking_right:
		get_node("sprite").set_flip_h(false)

func animationControl(newAnim):
	if newAnim != anim:
		get_node("anim").play(newAnim)
		anim = newAnim
	pass

func set_animation():
	if walking:
		newAnim = "run"
	elif jumping:
		if motion.y > 0:
			newAnim = "jump"
		else:
			newAnim = "fall"
	else:
		newAnim = "idle"
	animationControl(newAnim)

func dead():
	motion = Vector2(0,0)
	get_tree().change_scene("res://Scenes/Fases/Fase 1.tscn")

func change_floor():
	if is_move_and_slide_on_floor() && !is_on_floor:
		get_node("animEFX").play("falling")
	
	is_on_floor = is_move_and_slide_on_floor()

func change_plat_mov():
	if raycast.is_colliding():
		motion.y = 500


func _on_pes_body_enter( body ):
	if body.is_in_group(game.TYPE_ENEMY):
		jump()
		if body.has_method("_dano"):
			body._dano(dano)
		
