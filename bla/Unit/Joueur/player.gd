extends CharacterBody2D


func _ready() -> void:
	Globals.player = self

func _physics_process(delta):
	
	velocity.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	velocity.y = Input.get_action_strength("bottom") - Input.get_action_strength("top")
	velocity *= 150
	
	move_and_slide()
