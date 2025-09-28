extends Control


func _on_cancel_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")



func _on_add_button_pressed() -> void:
	if($"VBoxContainer/Panel2/Task Name".text == ""):
		return
	var task_name = $"VBoxContainer/Panel2/Task Name".text
	var task_desc = ""
	var focus = $VBoxContainer/FocusCheck.button_pressed
	var focusH = 0
	var focusM = 0
	var repeat = $VBoxContainer/Repeat.button_pressed
	var repeatType = 0
	var repeatCount = 0
	if(focus):
		focusH = $VBoxContainer/HBoxContainer/SpinBox.value
		focusM = $VBoxContainer/HBoxContainer/SpinBox2.value
		if(focusH == 0 and focusM == 0):
			return
	if(repeat):
		repeatType = $VBoxContainer/HBoxContainer2/OptionButton.selected
		if(repeatType == -1):
			return
		repeatCount = $VBoxContainer/HBoxContainer2/SpinBox.value
		if(repeatCount == 0):
			return
		repeatType += 1

	var task = Task.new(task_name, task_desc, focus, focusH, focusM, repeatType, repeatCount)
	ControlsData.addTask(task)
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_focus_check_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$VBoxContainer/HBoxContainer.visible = true
	else:
		$VBoxContainer/HBoxContainer.visible = false



func _on_repeat_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$VBoxContainer/HBoxContainer2.visible = true
	else:
		$VBoxContainer/HBoxContainer2.visible = false
