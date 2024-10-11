extends Sprite2D


@export var book_type := "light"

var player_in := false
var readed := false


func _input(event: InputEvent) -> void:
	if readed : return
	if Input.is_action_just_pressed("interact") && player_in:
		if book_type == "light":
			Globals.light = true
			$CanvasLayer/reading/light.show()
			get_parent().get_node("player light").show()
		elif book_type == "gravity":
			Globals.gravity2 = true
			$CanvasLayer/reading/anihilation.show()
		elif book_type == "glace":
			Globals.glace = true
			$CanvasLayer/reading/ice.show()
		elif book_type == "immune":
			Globals.immune = true
			$CanvasLayer/reading/immune.show()
		elif book_type == "trap detect":
			$CanvasLayer/reading/trap.show()
			Globals.trap_detect = true
			for i in get_parent().get_node("trap").get_children():
				i.show()
		elif book_type == "time stop":
			Globals.time_stop = true
			$CanvasLayer/reading/time.show()
		elif book_type == "ame":
			Globals.ame = true
			$CanvasLayer/reading/soul.show()
		Globals.book_desc.update_book()
		$CanvasLayer/reading.show()
		readed = true
		Globals.UI.get_node("press e read").hide()
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if readed: return
	if body.is_in_group("player"):
		player_in = true
		Globals.UI.get_node("press e read").show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in = false
		Globals.UI.get_node("press e read").hide()
