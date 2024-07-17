extends Control

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/ui/main_menu.tscn")

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/levels/level_1.tscn")

func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/levels/level_2.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/levels/level_3.tscn")
