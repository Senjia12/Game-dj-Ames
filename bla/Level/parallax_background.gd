extends ParallaxBackground


func _physics_process(delta: float) -> void:
	$ParallaxLayer.motion_offset += Vector2.RIGHT * delta * 25
