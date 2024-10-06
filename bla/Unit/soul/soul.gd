extends StaticBody2D


@export var talk := "coincoin"
@onready var blabla: RichTextLabel = $MarginContainer/blabla


func _ready() -> void:
	hide()
	blabla.text = "[wave amp=20][center][i]" + talk + "[/i][/center][/wave]"
	$AnimatedSprite2D.play("default")


func activate():
	if !is_visible_in_tree():
		show()
		$AnimationPlayer.play("spawn")
		for i in $Area2D.get_overlapping_bodies():
			if i.is_in_group("player"):
				$"text display 2".start()


func desactivate():
	hide()
	$AnimationPlayer.play("RESET")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && is_visible_in_tree():
		$"text display 2".start()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$"text display 2".stop()


func _on_text_display_2_timeout() -> void:
	blabla.visible_characters += 1
	if blabla.visible_ratio >= 1:
		$"text display 2".stop()
