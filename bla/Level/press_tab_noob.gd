extends CanvasLayer


func _ready() -> void:
	Globals.press_tab = self



func _physics_process(delta: float) -> void:
	if $Label.is_visible_in_tree():
		if Input.is_action_just_pressed("tab"):
			queue_free()
