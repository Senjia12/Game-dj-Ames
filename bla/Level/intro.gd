extends AnimationPlayer



func _ready() -> void:
	if Globals.first_loading:
		Globals.first_loading = false
		play("intro")
