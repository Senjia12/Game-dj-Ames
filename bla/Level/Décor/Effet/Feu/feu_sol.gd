extends AnimatedSprite2D


func _ready() -> void:
	play_backwards("default")


func _on_area_2d_body_entered(body: Node2D) -> void:
	Globals.UI.take_damage()
