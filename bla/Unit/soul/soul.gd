extends StaticBody2D


@export var talk := ["coincoin ?", "oui coinconi", "..."]
var current_text := 0
@onready var blabla: RichTextLabel = $MarginContainer/blabla

var player_in := false


func _ready() -> void:
	hide()
	blabla.text = "[wave amp=20][center][i]" + talk[current_text] + "[/i][/center][/wave]"
	$AnimatedSprite2D.play("default")


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") && player_in:
		blabla.visible_characters = 0
		blabla.text = "[wave amp=20][center][i]" + talk[current_text] + "[/i][/center][/wave]"
		current_text += 1
		if current_text == talk.size():
			current_text = 0
		$"text display 2".start()


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
		player_in = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in = false


func _on_text_display_2_timeout() -> void:
	blabla.visible_characters += 1
	if blabla.visible_ratio >= 1:
		$"text display 2".stop()
