extends Control

@onready var level_1 = $"../../.."
@onready var next = $VBoxContainer/Next

var next_level_number: int
var next_level_path: String

func _ready():
	var current_scene = get_tree().current_scene
	if current_scene:
		var current_scene_name = str(current_scene.name)  # Convert StringName to String
		var current_level_number = int(current_scene_name)  # Convert String to int
		next_level_number = current_level_number + 1
		next_level_path = "res://Scenes/levels/level_" + str(next_level_number) + ".tscn"
		update_next_button()

func update_next_button():
	var current_scene = get_tree().current_scene
	var current_scene_name = str(current_scene.name)
	var current_level_number = int(current_scene_name)
	if current_level_number == 3:
		next.text = "Credits"
		next.icon = load("res://Assets/Menu/Buttons/Achievements.png")
	else:
		next.text = "Next Level"
		next.icon = load("res://Assets/Menu/Buttons/Next.png")
		
func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/ui/main_menu.tscn")
	queue_free()

func _on_next_pressed():
	var current_scene = get_tree().current_scene
	var current_scene_name = str(current_scene.name)
	var current_level_number = int(current_scene_name)
	if current_level_number == 3:
		get_tree().change_scene_to_file("res://Scenes/ui/credits.tscn")
		
	else:
		get_tree().change_scene_to_file(next_level_path)
		
