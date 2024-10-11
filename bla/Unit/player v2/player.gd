extends CharacterBody2D


@onready var health: TextureProgressBar = $CanvasLayer/health
@export var speed := 50



var locked_velocity := Vector2.ZERO
var is_dashing := false
var can_dash := true

var current_hp := 30
var max_hp := 30

var dead := false

func _enter_tree() -> void:
	Globals.player = self


func _ready() -> void:
	Globals.player = self
	update_ui()
	if Globals.in_grotte:
		global_position = Globals.checkpoint_pos


func _physics_process(delta: float) -> void:
	if dead: return
	velocity = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),Input.get_action_strength("bottom") - Input.get_action_strength("top")).normalized() * speed
	
	if velocity != Vector2.ZERO:
		$AnimatedSprite2D.play("run")
		if velocity.x > 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("default")
	
	
	if Input.is_action_just_pressed("espace") && can_dash && velocity != Vector2.ZERO:
		locked_velocity = velocity
		is_dashing = true
		$dash_duration.start()
		$dash_cd.start()
		can_dash = false
	
	if is_dashing:
		velocity = locked_velocity * 3
	
	move_and_slide()


func update_ui():
	health.value = current_hp


func take_damage(dmg:int):
	current_hp -= dmg
	update_ui()
#	$CanvasLayer.show()
	if current_hp <= 0:
		$AnimatedSprite2D.play("couik")
		dead = true


func _on_dash_duration_timeout() -> void:
	is_dashing = false


func _on_dash_cd_timeout() -> void:
	can_dash = true


func _on_health_regen_timeout() -> void:
	if dead: return
	if current_hp < max_hp:
		current_hp += 1
	else:
		$CanvasLayer.hide()


func _on_animated_sprite_2d_animation_finished() -> void:
	get_tree().change_scene_to_packed(Globals.reload)
