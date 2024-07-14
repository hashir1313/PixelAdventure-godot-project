extends Label
@onready var level = $"../../.."

var applescollected

func _ready():
	applescollected = 0

func _process(delta):
	self.text = "Apples Collected : " + str(applescollected)
	if applescollected == level.max_apples or applescollected > level.max_apples:
		self.text = "All apples collected!"

func applecollected():
	applescollected += 1
