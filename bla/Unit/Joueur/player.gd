extends CharacterBody2D

func _enter_tree() -> void:
	Globals.player = self

func _physics_process(delta):
	var idle_player = $"idle player"
	#norme du vecteur sword_direction qui montre la direction où attaquer (vers la souris)
	var mouse_position = get_global_mouse_position()
	var player_position = get_global_position()
	var sword_direction = Vector2(mouse_position - player_position)
	sword_direction = sword_direction.normalized()
	
	$sword.look_at(mouse_position)
	$sword.rotation_degrees += 90
	$sword.show()
	
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
	
	if $sword.global_position.distance_to(global_position) > 20:
		$sword.position = ($sword.global_position - global_position).normalized() * 10
				
	if Input.is_action_just_pressed("espace") == true:
		$sword.play("sword_attack")
