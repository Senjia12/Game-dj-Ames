extends HBoxContainer



func _ready() -> void:
	update_book()
	Globals.book_desc = self



func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("tab"):
		show()
	elif Input.is_action_just_released("tab"):
		hide()



func update_book():
	if Globals.ame:
		$"soul reading".show()
	if Globals.gravity2:
		$Annihilate.show()
	if Globals.time_stop:
		$"Time stop".show()
	if Globals.light:
		$Light.show()
	if Globals.trap_detect:
		$"Trap détection".show()
	if Globals.glace:
		$Ice.show()
	if Globals.immune:
		$Immune.show()
