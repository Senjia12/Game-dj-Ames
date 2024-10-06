extends StaticBody2D


@export var talk := "coincoin"


func _ready() -> void:
	hide()


func activate():
	if !is_visible_in_tree():
		show()
		$AnimationPlayer.play("spawn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && is_visible_in_tree():
		$"text display".play("text display")
