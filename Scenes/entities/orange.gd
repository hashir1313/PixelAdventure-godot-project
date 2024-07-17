extends Area2D
@onready var item_label = $"../Player/Main Camera/Item label"

func _on_body_entered(body):
	if body.name == "Player":
		item_label.collected()
		queue_free()
