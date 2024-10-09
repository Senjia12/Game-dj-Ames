extends Area2D


var breaked := false


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if !breaked && !Globals.glace:
			$AnimatedSprite2D.play("default")
		else:
			body.queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	if !breaked:
		breaked = true
		for i in get_overlapping_bodies():
			if i.is_in_group("player"):
				i.queue_free()
		$AnimatedSprite2D.play("rebuild")
	else:
		breaked = false
