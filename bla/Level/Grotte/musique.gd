extends AudioStreamPlayer



func _ready() -> void:
	connect("finished",play_again)

func play_again():
	play()
