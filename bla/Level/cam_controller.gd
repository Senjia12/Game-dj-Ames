extends Camera2D


var targeted_zoom := 5.0
var target_diff := Vector2.ZERO
var current_diff := Vector2.ZERO
var target_y := 0.0
var current_y := 0.0

var in_room := false


func _ready() -> void:
	Globals.cam_controller = self



func _physics_process(delta: float) -> void:
	if !in_room:
		if target_y != 0.0:
			global_position = Vector2(Globals.player.global_position.x + current_diff.x,(Globals.player.global_position.y + current_y)/2 + current_diff.y)
		else:
			global_position = Globals.player.global_position + current_diff
		
		current_diff = lerp(current_diff, target_diff,0.03)
		zoom = lerp(zoom,Vector2(targeted_zoom,targeted_zoom),0.03)
		current_y = lerp(current_y,target_y,0.03)
	

func inside_room(pos):
	global_position = pos
	zoom = Vector2(5,5)
	in_room = true



func _on_cam_limiter_area_entered(area: Area2D) -> void:
	targeted_zoom = area.zoom
	target_diff = area.pos_diff
	target_y = area.target_y
	


func _on_cam_limiter_area_exited(area: Area2D) -> void:
	if $"cam limiter".get_overlapping_areas() == []:
		targeted_zoom = 4.0
		target_y = 0.0
		target_diff = Vector2.ZERO
	else:
		_on_cam_limiter_area_entered($"cam limiter".get_overlapping_areas()[0])
