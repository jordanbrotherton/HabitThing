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

func fromDict(d, ss):
	taskName = d["name"]
	taskDescription = d["desc"]
	isFocus = d["isFocus"]
	focusH = d["focusH"]
	focusM = d["focusM"]
	repeatType = d["repeatType"]
	repeats = d["repeats"]
	timeCreated = d["timeCreated"]
	isCompleted = d["isCompleted"]
	# Reload Dates
	var isStreakContinue = true
	var streakStartTime = Time.get_unix_time_from_datetime_dict(ss)
	var ourTimeDict = Time.get_datetime_dict_from_system()
	var ourTime = Time.get_unix_time_from_datetime_dict(Time.get_datetime_dict_from_system())
	var theirTime = Time.get_unix_time_from_datetime_dict(timeCreated)
	var diffTime = ourTime - theirTime
	var diffTimeDict = Time.get_datetime_dict_from_unix_time(diffTime)
	var diffTime2 = ourTime - streakStartTime
	if(repeatType != repeatTypes.NONE):
		if(repeatType == repeatTypes.DAILY):
			if((diffTime / 3600) >= 24):
				if(!isCompleted):
					ControlsData.streak = 0
					isStreakContinue = false
				isCompleted = false
				timeCreated = ourTimeDict
		elif(repeatType == repeatTypes.WEEKLY):
			if((diffTime / 86400) >= 7):
				if(!isCompleted):
					ControlsData.streak = 0
					isStreakContinue = false
				isCompleted = false
				timeCreated = ourTimeDict
		elif(repeatType == repeatTypes.MONTHLY):
			if(ourTimeDict["month"] != timeCreated["month"] || ((ourTimeDict["month"] == timeCreated["month"])) && (ourTimeDict["year"] != timeCreated["year"])):
				if(!isCompleted):
					ControlsData.streak = 0
					isStreakContinue = false
				isCompleted = false
				timeCreated = ourTimeDict
		elif(repeatType == repeatTypes.YEARLY):
			if(ourTimeDict["year"] != timeCreated["year"]):
				if(!isCompleted):
					ControlsData.streak = 0
					isStreakContinue = false
				isCompleted = false
				timeCreated = ourTimeDict
	else:
		if(diffTime / 3600 >= 24 && !isCompleted):
			ControlsData.streak = 0
			isStreakContinue = false
	if((diffTime2 / 3600) >= 24 && isStreakContinue):
		ControlsData.streak += 1
		return Time.get_datetime_dict_from_system()
	elif(!isStreakContinue):
		return Time.get_datetime_dict_from_system()
	return 0


	
