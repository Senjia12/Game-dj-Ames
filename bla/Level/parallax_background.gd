extends ParallaxBackground


func _physics_process(delta: float) -> void:
	offset += Vector2.RIGHT * delta * 25
