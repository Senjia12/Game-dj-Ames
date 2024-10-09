extends Area2D



var new_scene = load("res://Level/game.tscn")




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene_to_packed",new_scene)
