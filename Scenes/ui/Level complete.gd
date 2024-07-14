extends Control
@onready var level_1 = $"../../.."

func _on_restart_pressed():
	get_tree().reload_current_scene()
	Engine.time_scale = 0

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/ui/main_menu.tscn")
	queue_free()

func _on_next_pressed():
	var current_scene_name = str(get_tree().current_scene.name)  # Convert StringName to String
	var current_level_number = int(current_scene_name)  # Convert String to int
	var next_level_number = current_level_number + 1
	var next_level_path = "res://Scenes/levels/level_" + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)




