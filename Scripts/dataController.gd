class_name DataController

var streak = 0;
var tasksCompleted = 0;
var tasksList = []

var hatsOwned = []
var hatDatabase = []
 
func load_hats():
	var hatJSONString = FileAccess.open("res://Assets/hatlist.json", FileAccess.READ)
	var hatJSON = JSON.parse_string(hatJSONString.get_as_text())
	for hat in hatJSON["hats"]:
		var hatEntry = Hat.new(hat["name"], hat["desc"], hat["cost"], hat["path"])
		hatDatabase += hatEntry

func _init():
	load_hats()

func load_data():
	pass

func save_data():
	pass
