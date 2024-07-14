extends Node
@onready var player = $Player
@onready var level_complete = $"Player/Main Camera/Level complete"
@onready var pause_menu = $"Player/Main Camera/Pause Menu"
@onready var collect_all_apples = $"End/Collect all apples"
@onready var apples = $"Player/Main Camera/Apples"
var paused = false
var max_apples = 26

func _ready():
	player.show()
	pause_menu.hide()
	level_complete.hide()
	Engine.time_scale = 1

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pausemenu()

func pausemenu():
	if paused:
		pause_menu.hide()
		$"Player/Main Camera/Apples".show()
		Engine.time_scale = 1
	else :
		pause_menu.show()
		$"Player/Main Camera/Apples".hide()
		Engine.time_scale = 0
	paused = !paused

func levelcomplete():
	level_complete.show()
	Engine.time_scale = 0

func restartlevel():
	get_tree().reload_current_scene()
	Engine.time_scale = 1

func _on_border_body_entered(body):
	if body.name == ("Player"):
		restartlevel()
