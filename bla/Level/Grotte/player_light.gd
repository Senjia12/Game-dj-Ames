extends Node2D




func _physics_process(delta: float) -> void:
	global_position = Globals.player.global_position + Vector2.DOWN * 16
	
