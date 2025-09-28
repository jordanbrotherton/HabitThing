class_name Task extends Node

enum repeatTypes { NONE, DAILY, WEEKLY, MONTHLY, YEARLY }

var taskName = "Task"
var taskDescription = ""
var isFocus = false
var focusH = 0
var focusM = 0
var repeatType = repeatTypes.NONE
var repeats = 0
var timeCreated = Time.get_datetime_dict_from_system()
var isCompleted = false

func _init(n, d, f, fh, fm, rt, r) -> void:
    taskName = n
    taskDescription = d
    isFocus = f
    focusH = fh
    focusM = fm
    repeatType = rt
    repeats = r

func toDict():
    return {
        "name": taskName,
        "desc": taskDescription,
        "isFocus": isFocus,
        "focusH": focusH,
        "focusM": focusM,
        "repeatType": repeatType,
        "repeats": repeats,
        "timeCreated": timeCreated,
        "isCompleted": isCompleted
    }

func fromDict(d):
    taskName = d["name"]
    taskDescription = d["desc"]
    isFocus = d["isFocus"]
    focusH = d["focusH"]
    focusM = d["focusM"]
    repeatType = d["repeatType"]
    repeats = d["repeats"]
    timeCreated = d["timeCreated"]
    isCompleted = d["isCompleted"]