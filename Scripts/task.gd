class_name Task extends Node

enum repeatTypes { NONE, DAILY, WEEKLY }

var taskName = "Task"
var dueDate = Time.get_unix_time_from_datetime_string("1970-01-01T10:00:00")
var repeatType = repeatTypes.NONE

