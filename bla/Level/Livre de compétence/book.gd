extends Sprite2D


@export var book_type := "light"

var player_in := false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") && player_in:
		if book_type == "light":
			Globals.light = true
			get_parent().get_node("player light").show()
		elif book_type == "gravity":
			Globals.gravity2 = true
		elif book_type == "glace":
			Globals.glace = true
		elif book_type == "immune":
			Globals.immune = true
		elif book_type == "trap detect":
			Globals.trap_detect = true
			for i in get_parent().get_node("trap").get_children():
				i.show()
		elif book_type == "time stop":
			Globals.time_stop = true
		elif book_type == "ame":
			Globals.ame = true
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in = true
		Globals.UI.get_node("press e read").show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in = false
		Globals.UI.get_node("press e read").hide()
