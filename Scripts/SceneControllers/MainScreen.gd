extends Control

var task_index = 0
var isCompleteIndex = false

func _ready() -> void:
	$VBoxContainer/ScrollContainer/VBoxContainer/TextureRect.texture = load(ControlsData.currHat)
	$VBoxContainer/ScrollContainer/VBoxContainer/DueList.clear()
	$VBoxContainer/ScrollContainer/VBoxContainer/CompleteList.clear()
	$TaskD/Transperancy.visible = false
	$TaskD/Panel.visible = false
	$TaskD/X_button.visible = false
	$TaskD/Focus.visible = false
	$TaskD/Panel3.visible = false
	$TaskD/TaskN.visible = false
	$TaskD/Panel2.visible = false
	$TaskD/DescLabel.visible = false
	$TaskD/TaskDescription.visible = false
	for task in ControlsData.completedTasksList:
		$VBoxContainer/ScrollContainer/VBoxContainer/CompleteList.add_item(task.taskName)
	for task in ControlsData.tasksList:
		$VBoxContainer/ScrollContainer/VBoxContainer/DueList.add_item(task.taskName)
	$VBoxContainer/ScrollContainer/VBoxContainer/Streak.text = str(int(ControlsData.streak)) + " Days"

func _on_add_clicked() -> void:
	get_tree().change_scene_to_file("res://Scenes/TaskMaker.tscn")


func _on_shop_clicked() -> void:
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")

func _on_stats_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Stats.tscn")


func _on_due_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
		if(mouse_button_index == MOUSE_BUTTON_LEFT):
			isCompleteIndex = false
			task_index = index
			set_description(task_index)
			queue_redraw()
			$TaskD.visible = true
			$TaskD/Transperancy.visible = true
			$TaskD/Panel.visible = true
			$TaskD/X_button.visible = true
			$TaskD/Focus.visible = true
			$TaskD/Panel3.visible = true
			$TaskD/TaskN.visible = true
			$TaskD/Panel2.visible = true
			$TaskD/DescLabel.visible = true
			$TaskD/TaskDescription.visible = true

func set_description(num):
	if(isCompleteIndex):
		$TaskD/TaskN.text = ControlsData.completedTasksList[num].taskName
		$TaskD/DescLabel.text = ControlsData.completedTasksList[num].taskDescription
	else:
		if(ControlsData.tasksList[num].isFocus):
			$TaskD/Focus.text = "Focus"
		else:
			$TaskD/Focus.text = "Mark as Complete"
		$TaskD/TaskN.text = ControlsData.tasksList[num].taskName
		$TaskD/DescLabel.text = ControlsData.tasksList[num].taskDescription
			

func _on_x_button_pressed() -> void:
	$TaskD/Transperancy.visible = false
	$TaskD/Panel.visible = false
	$TaskD/X_button.visible = false
	$TaskD/Focus.visible = false
	$TaskD/Panel3.visible = false
	$TaskD/TaskN.visible = false
	$TaskD/Panel2.visible = false
	$TaskD/DescLabel.visible = false
	$TaskD/TaskDescription.visible = false


func _on_focus_pressed() -> void:
	$TaskD/Transperancy.visible = false
	$TaskD/Panel.visible = false
	$TaskD/X_button.visible = false
	$TaskD/Focus.visible = false
	$TaskD/TaskN.visible = false
	$TaskD/DescLabel.visible = false
	$TaskD/TaskDescription.visible = false
	if(ControlsData.tasksList[task_index].isFocus):
		get_tree().change_scene_to_file("res://Scenes/Focus.tscn")
	else:
		ControlsData.tasksList[task_index].isCompleted = true
		ControlsData.completedTasksList.append(ControlsData.tasksList[task_index])
		ControlsData.tasksList.erase(ControlsData.tasksList[task_index])
		ControlsData.save_data()
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func _on_complete_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if(mouse_button_index == MOUSE_BUTTON_LEFT):
			task_index = index
			isCompleteIndex = true
			set_description(task_index)
			queue_redraw()
			$TaskD.visible = true
			$TaskD/Transperancy.visible = true
			$TaskD/Panel.visible = true
			$TaskD/X_button.visible = true
			$TaskD/Focus.visible = false
			$TaskD/TaskN.visible = true
			$TaskD/DescLabel.visible = true
			$TaskD/TaskDescription.visible = true
