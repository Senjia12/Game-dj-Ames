extends TextureRect

var click := 0

func _physics_process(delta: float) -> void:
	if is_visible_in_tree():
		if Input.is_action_just_pressed("interact") or Input.is_action_just_pressed("clic_gauche") or Input.is_action_just_pressed("scan"):
			click += 1
			if click >= 2:
				if get_parent().get_parent().book_type == "ame":
					Globals.press_tab.get_child(0).show()
					
				get_parent().get_parent().queue_free()
