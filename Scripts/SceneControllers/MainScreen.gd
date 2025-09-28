extends Control

func _ready() -> void:
	$VBoxContainer/ScrollContainer/VBoxContainer/DueList.clear()
	$VBoxContainer/ScrollContainer/VBoxContainer/CompleteList.clear()
	for task in ControlsData.tasksList:
		if(task.isCompleted):
			$VBoxContainer/ScrollContainer/VBoxContainer/CompleteList.add_item(task.taskName)
		else:
			$VBoxContainer/ScrollContainer/VBoxContainer/DueList.add_item(task.taskName)

func _on_add_clicked() -> void:
	get_tree().change_scene_to_file("res://Scenes/TaskMaker.tscn")


func _on_shop_clicked() -> void:
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")


func _on_stats_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Stats.tscn")
