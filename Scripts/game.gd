extends Node

const TYPE_PLAYER = "player"
const TYPE_ENEMY = "enemy"
const TYPE_PLATFOMER = "platformer_movel"
var score = 0
var vida_player = 3 setget set_vidaPlayer

signal carrega_vida

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_vidaPlayer(valor):
	vida_player = valor
	emit_signal("carrega_vida")
	pass