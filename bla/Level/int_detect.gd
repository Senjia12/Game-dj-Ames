extends Area2D







func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.cam_controller.position_smoothing_enabled = true
		Globals.cam_controller.inside_room(global_position)
