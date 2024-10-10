extends AnimatedSprite2D

var player_in := false


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") && player_in:
		$StaticBody2D/CollisionShape2D.disabled = true
		$AnimationPlayer.play("fade")
		$"../feu point3".emitting = false
		$"../sans mur".show()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if Globals.gravity2:
			Globals.UI.get_node("press e").show()
			player_in = true
		else:
			Globals.UI.get_node("ther surely").show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if Globals.gravity2:
			Globals.UI.get_node("press e").hide()
			player_in = false
		else:
			Globals.UI.get_node("ther surely").hide()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Globals.UI.get_node("ther surely").hide()
	Globals.UI.get_node("press e").hide()
	queue_free()
