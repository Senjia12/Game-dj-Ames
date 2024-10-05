extends StaticBody2D


# 0 = maison 1; 1 = maison 2; 2 = tour du sorcier
@export var building_type := 0
@onready var sprite: AnimatedSprite2D = $sprite



func  _ready() -> void:
	if building_type == 0:
		sprite.play("maison 1")
		sprite.position = Vector2(0,-29)
	elif building_type == 1:
		sprite.play("maison 2")
		sprite.position = Vector2(-10,-29)
	elif building_type == 2:
		sprite.play("tour")
		sprite.position = Vector2(0,-58.5)
