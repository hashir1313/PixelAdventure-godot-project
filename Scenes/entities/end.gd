extends Node

@onready var label = $"Collect all apples"
@onready var item_label = $"../Player/Main Camera/Item label"
@onready var level = $".."

func _ready():
	_update_label_text()
	label.hide()

func _process(delta):
	if level.level_comp:
		label.hide()
	if level.paused:
		label.hide()

func _on_body_entered(body):
	if body.name == "Player":
		if item_label.applescollected == level.max_apples:
			level.levelcomplete()
			label.hide()
		else:
			label.show()

func _update_label_text():
	if level.oranges == true:
		label.text = "Collect " + str(level.max_apples) + " Oranges!"
	else:
		label.text = "Collect " + str(level.max_apples) + " Apples!"
	

