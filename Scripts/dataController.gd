class_name DataController extends Node

var streak = 0;
var tasksCompleted = 0;
var tasksList = []

var hatsOwned = []
var hatDatabase = []
 
func load_hats():
	print("hatts")
	var hatJSONString = FileAccess.open("res://Assets/hatlist.json", FileAccess.READ)
	var hatJSON = JSON.parse_string(hatJSONString.get_as_text())
	for hat in hatJSON["hats"]:
		print(hat["name"])
		var hatEntry = Hat.new(hat["name"], hat["desc"], hat["path"], hat["cost"])
		hatDatabase.append(hatEntry)

func _init() -> void:
	load_hats()

func load_data():
	pass

func save_data():
	pass
