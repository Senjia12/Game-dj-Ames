extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var area_2d: Area2D = $Area2D

var can_freeze := true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("scan"):
		global_position = Globals.player.global_position
		animation_player.play("scan")
		
		for i in area_2d.get_overlapping_bodies():
			if i.is_in_group("soul"):
				i.activate()
	
	if Input.is_action_just_pressed("time stop") && can_freeze:
		get_tree().paused = true
		$"freeze duration".start()
		$"freeze cd".start()
		$CanvasLayer/grey.show()
		can_freeze = false


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("soul"):
		body.desactivate()


func _on_freeze_duration_timeout() -> void:
	get_tree().paused = false
	$CanvasLayer/grey.hide()


func _on_freeze_cd_timeout() -> void:
	can_freeze = true
