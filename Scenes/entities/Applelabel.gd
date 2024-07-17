extends Label
@onready var level = $"../../.."

var applescollected

func _ready():
	applescollected = 0

func _process(delta):
	if level.oranges == false:
		self.text = "Apples Collected : " + str(applescollected)
		if applescollected == level.max_apples :
					self.text = "All apples collected!"
	if level.oranges == true:
		self.text = "Oranges Collected : " + str(applescollected)
		if applescollected == level.max_apples :
					self.text = "All Oranges collected!"

func collected():
		applescollected += 1
