extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var area_2d: Area2D = $Area2D



func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("scan"):
		global_position = Globals.player.global_position
		animation_player.play("scan")
		
		for i in area_2d.get_overlapping_bodies():
			if i.is_in_group("soul"):
				i.activate()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("soul"):
		body.desactivate()
		
		
		
