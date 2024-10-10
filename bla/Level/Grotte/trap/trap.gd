extends Node2D



func _ready() -> void:
	if !Globals.trap_detect:
		hide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		show()
		body.queue_free()
		$AnimatedSprite2D.play("default")
