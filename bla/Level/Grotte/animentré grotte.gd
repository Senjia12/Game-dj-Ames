extends AnimationPlayer


func _ready() -> void:
	get_child(0).show()
	play("entré")
	$"../CanvasModulate".show()
