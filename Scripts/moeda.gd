extends Area2D


func _on_moeda_body_enter( body ):
	if body.is_in_group(game.TYPE_PLAYER):
		game.score = 1
		get_node("shape").queue_free()
		get_node("anim").play("destroy")
		yield(get_node("anim"), "finished")
		queue_free()

