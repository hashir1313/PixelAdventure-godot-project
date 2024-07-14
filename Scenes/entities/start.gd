extends AnimatedSprite2D
@onready var label = $Label
@onready var level = $".."

func _ready():
	label.hide()

func _process(delta):
	if level.paused:
		label.hide()

func _on_wrong_side_body_entered(body):
	if body.name == "Player":
		label.show()

func _on_right_side_body_entered(body):
	if body.name == "Player":
		label.hide()
