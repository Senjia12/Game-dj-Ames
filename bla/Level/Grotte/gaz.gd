extends MeshInstance2D




func _physics_process(delta: float) -> void:
	get_texture().noise.set_offset(get_texture().noise.get_offset() + Vector3(1,0,0) * delta * 20)


func _on_player_in_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && !Globals.immune:
		body.take_damage(5)
		$"../Timer".start()


func _on_timer_timeout() -> void:
	if $"../player_in".get_overlapping_bodies().has(Globals.player):
		Globals.player.take_damage(5)
