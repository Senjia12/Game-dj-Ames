extends TileMapLayer




func _physics_process(delta: float) -> void:
	if Globals.glace:
		var pos = local_to_map(Globals.player.global_position)
		if get_cell_tile_data(pos) != null:
			set_cell(pos,0,Vector2.ZERO)
		if get_cell_tile_data(pos+Vector2i.RIGHT) != null:
			set_cell(pos+Vector2i.RIGHT,0,Vector2.ZERO)
		if get_cell_tile_data(pos+Vector2i.UP) != null:
			set_cell(pos+Vector2i.UP,0,Vector2.ZERO)
		if get_cell_tile_data(pos+Vector2i.LEFT) != null:
			set_cell(pos+Vector2i.LEFT,0,Vector2.ZERO)
		if get_cell_tile_data(pos+Vector2i.DOWN) != null:
			set_cell(pos+Vector2i.DOWN,0,Vector2.ZERO)
