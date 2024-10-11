extends Node


var player
var UI

@onready var reload = preload("res://Level/Grotte/grotte.tscn")
var checkpoint_pos := Vector2.ZERO

var player_transi_pos := Vector2.ZERO
var cam_controller
var book_desc

var in_grotte := false
var first_loading := true
var press_tab

### capacity
var gravity2 := false
var time_stop := false
var light := false
var trap_detect := false
var glace := false
var immune := false
var ame := false
