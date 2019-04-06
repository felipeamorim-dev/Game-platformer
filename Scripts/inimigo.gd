extends "res://Scripts/inimgo_base.gd"

onready var raycastPos = Vector2(get_node("raycast").get_pos())
onready var raycast = get_node("raycast")
export(int, 1, 10) var vida = 1

 
func _ready():
	add_to_group(game.TYPE_ENEMY)
	set_fixed_process(true)

func _fixed_process(delta):
	move_inimigo()
	changer_direction_floor()
	change_diretion()
	flip_horizontal()

func flip_horizontal():
	if direction == 1:
		get_node("sprite").set_flip_h(true)
	
	if direction == -1:
		get_node("sprite").set_flip_h(false)

func change_diretion():
	if is_move_and_slide_on_wall():
		direction *= -1
		raycastPos.x *= -1
		raycast.set_pos(raycastPos)

func changer_direction_floor():
	if raycast.is_colliding() == false:
		direction *= -1
		raycastPos.x *= -1
		raycast.set_pos(raycastPos)

func _dano(dano):
	vida -= dano
	if vida <= 0:
		get_node("shape").queue_free()
		queue_free()
		pass

func _on_body_body_enter( body ):
	if body.is_in_group(game.TYPE_PLAYER):
		if body.has_method("dead"):
			body.dead()