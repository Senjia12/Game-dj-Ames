extends AnimationPlayer


func _on_detect_enter_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.player.dead = true
		play("anim fin")
		$"8s".start()
		$"8s2".start()


func _on_s_timeout() -> void:
	$dragon.play("idle")


func _on_s_2_timeout() -> void:
	$"../player".get_node("AnimatedSprite2D").play("default")
