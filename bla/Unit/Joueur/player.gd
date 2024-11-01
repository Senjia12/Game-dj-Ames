extends CharacterBody2D


@onready var attack_area: Area2D = $sword/attack_area
@onready var dash_cd: Timer = $"dash cd"
@onready var dash_duration: Timer = $"dash duration"
@onready var attack_cd: Timer = $"attack cd"
var atk_cd = true
var dash_end = true
var dash_cooldown := true
var velocity_dash := Vector2.ZERO
var body_enter = []
var hp_max = 30
var hp_current = 30
var hp_regen_cd = false

func _enter_tree() -> void:
	Globals.player = self

func _physics_process(delta):
	var idle_player = $"idle player"
	#norme du vecteur sword_direction qui montre la direction où attaquer (vers la souris)
	var mouse_position = get_global_mouse_position()
	var player_position = get_global_position()
	var sword_position = $sword.get_global_position ()
	var sword_direction = Vector2(mouse_position - player_position)
	sword_direction = sword_direction.normalized()
	var sword_tp_atk = Vector2(sword_position - player_position)
	
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
	
	if $sword.global_position.distance_to(global_position) > 20:
		$sword.position = (global_position - $sword.global_position).normalized() * 10
	
	if Input.is_action_just_pressed("clic_gauche") == true:
		$sword.play("sword_attack")
		atk_cd = false
		attack_cd.start()
		
	if dash_end == false:
		velocity = velocity_dash
	
	if Input.is_action_just_pressed("espace") and dash_cooldown == true and dash_end == true and velocity != Vector2.ZERO:
		velocity_dash = velocity * 3
		dash_cooldown = false
		dash_end = false
		dash_cd.start()
		dash_duration.start()
	
	move_and_slide()
	
	if hp_regen_cd == true:
		$hp_regen.start()

func _on_attack_cd_timeout() -> void:
	atk_cd = true

func _on_dash_duration_timeout() -> void:
	dash_end = true

func _on_dash_cd_timeout() -> void:
	dash_cooldown = true

func _on_attack_area_body_entered(body: Node2D) -> void:
	body_enter.append (body)

func _on_attack_area_body_exited(body: Node2D) -> void:
	body_enter.erase(body)

func _on_hp_regen_timeout() -> void:
	hp_regen_cd = true

func _on_hp_cd_timeout() -> void:
	pass # Replace with function body.
