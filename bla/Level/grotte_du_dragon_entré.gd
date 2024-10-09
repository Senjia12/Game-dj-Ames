extends Sprite2D


var player_in := false
@onready var new_scene = preload("res://Level/Grotte/grotte.tscn")
var just_back := false

func _ready() -> void:
	if Globals.player_transi_pos != Vector2.ZERO:
		Globals.player.global_position = Globals.player_transi_pos
		$transi.play_backwards("transi")
		just_back = true


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") && player_in && !$transi.is_playing():
		$transi.play("transi")



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.UI.get_node("press e enter").show()
		player_in = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.UI.get_node("press e enter").hide()
		player_in = false


func _on_transi_animation_finished(anim_name: StringName) -> void:
	if !just_back:
		get_tree().change_scene_to_packed(new_scene)
		Globals.player_transi_pos = Globals.player.global_position
	else:
		just_back = false
