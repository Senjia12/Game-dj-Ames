extends Node2D


func _ready() -> void:
	if !Globals.light:
		hide()


func _physics_process(delta: float) -> void:
	global_position = Globals.player.global_position + Vector2.DOWN * 16
	
