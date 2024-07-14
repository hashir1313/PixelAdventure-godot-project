extends Node
@onready var pause_menu = $"Player/Main Camera/Pause Menu"
@onready var level_complete = $"Player/Main Camera/Level complete"
@onready var collect_all_apples = $"End/Collect all apples"
@onready var apples = $"Player/Main Camera/Apples"
@export var paused = false
var level_comp = false
var max_apples = 19

func _on_ready():
	$Player.show()
	apples.show()
	pause_menu.hide()
	level_complete.hide()
	Engine.time_scale = 1

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pausemenu()

func pausemenu():
	if paused:
		pause_menu.hide()
		apples.show()
		Engine.time_scale = 1
	else :
		pause_menu.show()
		apples.hide()
		Engine.time_scale = 0
	paused = !paused

func _on_area_2d_body_entered(body):
	if body.name == "Player" :
		get_tree().reload_current_scene()
		Engine.time_scale = 1

func levelcomplete():
	level_comp = true
	apples.hide()
	collect_all_apples.hide()
	level_complete.show()
	Engine.time_scale = 0

