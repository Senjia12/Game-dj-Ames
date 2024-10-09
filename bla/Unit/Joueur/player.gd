extends CharacterBody2D


func _enter_tree() -> void:
	Globals.player = self

func _physics_process(delta):
	var idle_player = $"idle player"
	velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.y = Input.get_action_strength("bottom") - Input.get_action_strength("top")
	velocity = velocity.normalized()
	velocity *= 50
	
	if velocity.length() > 0:
		idle_player.play("walking player")
		idle_player.speed_scale = 0.7
		if velocity.x != 0:
			idle_player.flip_h = velocity.x > 0
			
	else: 
		idle_player.play("default")
		idle_player.speed_scale = 0.3
	move_and_slide()
