extends Control



func _ready() -> void:
	Globals.UI = self



func take_damage():
	$AnimationPlayer.play("dmg")
