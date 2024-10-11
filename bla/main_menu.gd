extends CanvasLayer


@onready var main_scene = preload("res://Level/game.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(main_scene)


func _on_quit_pressed() -> void:
	get_tree().quit()
