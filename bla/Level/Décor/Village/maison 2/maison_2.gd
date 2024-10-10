extends StaticBody2D


@export var position_int := Vector2.ZERO
var player_in := false



func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") && player_in:
		Globals.cam_controller.position_smoothing_enabled = false
		Globals.player.global_position = position_int


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.UI.get_node("press e enter").show()
		player_in = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.UI.get_node("press e enter").hide()
		player_in = false
