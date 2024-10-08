extends Camera2D


var targeted_zoom := 0.0



func _physics_process(delta: float) -> void:
	global_position = Globals.player.global_position


func _on_cam_limiter_area_entered(area: Area2D) -> void:
	targeted_zoom = float(str(area.name))
	
	zoom = Vector2(targeted_zoom,targeted_zoom)
	
