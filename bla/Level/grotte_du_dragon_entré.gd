extends Sprite2D


var player_in := false
@onready var new_scene = preload("res://Level/Grotte/grotte.tscn")


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") && player_in:
		get_tree().change_scene_to_packed(new_scene)



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.UI.get_node("press e enter").show()
		player_in = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.UI.get_node("press e enter").hide()
		player_in = false
