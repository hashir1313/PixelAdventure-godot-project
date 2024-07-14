extends Control
@onready var level_1 = $"../../.."
func _on_resume_pressed():
	get_tree().current_scene.pausemenu()

func _on_restart_pressed():
	get_tree().reload_current_scene()
	Engine.time_scale = 1

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/ui/main_menu.tscn")
	queue_free()
