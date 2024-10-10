extends Node2D



func _ready() -> void:
	if !Globals.trap_detect:
		hide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		show()
		body.take_damage(30)
		$AnimatedSprite2D.play("default")
