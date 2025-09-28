class_name DataController extends Node

var streak = 0;
var tasksCompleted = 0;
var tasksList = []

var hatsOwned = []
var hatDatabase = []
 
var currHat = "res://lilguy/base/base.tres"

func load_data():
	var savePath = FileAccess.open("user://save.json", FileAccess.READ)
	if(savePath != null):
		var saveData = savePath.get_line()
		var saveJSON = JSON.parse_string(saveData)
		tasksCompleted = saveJSON["tasksCompleted"]
		streak = saveJSON["streak"]
		for task in saveJSON["tasks"]:
			var t = Task.new("", "", false, 0, 0, 0, 0)
			t.fromDict(task);
			tasksList.append(t)
		hatsOwned = saveJSON["hatsOwned"]

func save_data():
	var taskArr = [] 
	for task in tasksList:
		taskArr.append(task.toDict())
	var saveDict = {
		"streak" : streak,
		"tasksCompleted": tasksCompleted,
		"tasks" : taskArr,
		"hatsOwned": hatsOwned
	}
	var saveData = JSON.stringify(saveDict)
	var savePath = FileAccess.open("user://save.json", FileAccess.WRITE)
	savePath.store_line(saveData)

func load_hats():
	var hatJSONString = FileAccess.open("res://Assets/hatlist.json", FileAccess.READ)
	var hatJSON = JSON.parse_string(hatJSONString.get_as_text())
	for hat in hatJSON["hats"]:
		print(hat["name"])
		var hatEntry = Hat.new(hat["name"], hat["cost"], hat["rarity"], hat["path"],  hat["desc"])
		hatDatabase.append(hatEntry)

func set_hats(newHat):
	currHat = newHat;

func _init() -> void:
	load_hats()
	load_data()

func addTask(t) -> void:
	tasksList.append(t)
	save_data()
