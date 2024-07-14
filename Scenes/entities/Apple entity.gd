extends Area2D
@onready var apples = $"../Player/Main Camera/Apples"

func _on_body_entered(body):
	if body.name == "Player":
		apples.applecollected()
		queue_free()
