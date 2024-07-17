extends Node
@onready var player = $Player
@onready var level_complete = $"Player/Main Camera/Level complete"
@onready var pause_menu = $"Player/Main Camera/Pause Menu"
@onready var collect_all_apples = $"End/Collect all apples"
@onready var item_label = $"Player/Main Camera/Item label"
var paused = false
var level_comp = false
var oranges = true
var max_apples = 16

func _ready():
	
	player.show()
	item_label.show()
	pause_menu.hide()
	level_complete.hide()
	Engine.time_scale = 1
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pausemenu()

func pausemenu():
	if paused:
		pause_menu.hide()
		$"Player/Main Camera/Item label".show()
		Engine.time_scale = 1
	else :
		pause_menu.show()
		$"Player/Main Camera/Item label".hide()
		Engine.time_scale = 0
	paused = !paused

func levelcomplete():
	item_label.hide()
	level_comp = true
	level_complete.show()
	Engine.time_scale = 0

func restartlevel():
	get_tree().reload_current_scene()
	Engine.time_scale = 1

func _on_border_body_entered(body):
	if body.name == ("Player"):
		restartlevel()
