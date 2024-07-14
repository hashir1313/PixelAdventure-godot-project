extends Node
@onready var label = $"Collect all apples"
@onready var apples = $"../Player/Main Camera/Apples"
@onready var level = $".."
var label_shown

func _ready():
	label_shown = false
	label.text = "Collect " + str(level.max_apples) + " Apples!"
	label.hide()

func _process(delta):
	if level.paused:
		label.hide()
	if level.level_comp == true :
		label.hide()
	else:
		if label_shown:
			label.show()
		else:
			label.hide()

func _on_body_entered(body):
	if body.name == "Player":
		if apples.applescollected == level.max_apples:
			if label_shown:
				label.hide()
			level.levelcomplete()
		else:
			label_shown = true
