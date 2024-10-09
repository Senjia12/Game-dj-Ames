extends Area2D



@export var out_pos := Vector2.ZERO



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.cam_controller.position_smoothing_enabled = true
		Globals.cam_controller.inside_room(global_position)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.cam_controller.position_smoothing_enabled = false
		Globals.cam_controller.in_room = false
		Globals.player.global_position = out_pos
