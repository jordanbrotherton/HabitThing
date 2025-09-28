extends Control

var task_index = 0

func _ready() -> void:
	$VBoxContainer/ScrollContainer/VBoxContainer/DueList.clear()
	$VBoxContainer/ScrollContainer/VBoxContainer/CompleteList.clear()
	$TaskD/Transperancy.visible = false
	$TaskD/Panel.visible = false
	$TaskD/X_button.visible = false
	$TaskD/Focus.visible = false
	$TaskD/TaskN3.visible = false
	$VBoxContainer/ScrollContainer/VBoxContainer/TextureRect.texture = load(ControlsData.currHat)
	for task in ControlsData.completedTasksList:
		$VBoxContainer/ScrollContainer/VBoxContainer/CompleteList.add_item(task.taskName)
	for task in ControlsData.tasksList:
		$VBoxContainer/ScrollContainer/VBoxContainer/DueList.add_item(task.taskName)

func _on_add_clicked() -> void:
	get_tree().change_scene_to_file("res://Scenes/TaskMaker.tscn")


func _on_shop_clicked() -> void:
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")

func _on_stats_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Stats.tscn")


func _on_due_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if(mouse_button_index == MOUSE_BUTTON_LEFT):
		print("hello")
		task_index = index
		set_description(task_index)
		queue_redraw()
		$TaskD.visible = true
		$TaskD/Transperancy.visible = true
		$TaskD/Panel.visible = true
		$TaskD/X_button.visible = true
		$TaskD/Focus.visible = true
		$TaskD/TaskN.visible = true
		$TaskD/TaskN3.visible = true

func set_description(num):
	$TaskD/TaskN.text = ControlsData.tasksList[num].taskName
	$TaskD/TaskN2.text = ControlsData.tasksList[num].taskDescription

func _on_x_button_pressed() -> void:
	$TaskD/Transperancy.visible = false
	$TaskD/Panel.visible = false
	$TaskD/X_button.visible = false
	$TaskD/Focus.visible = false
	$TaskD/TaskN.visible = false
	$TaskD/TaskN2.visible = false
	$TaskD/TaskN3.visible = false


func _on_focus_pressed() -> void:
	$TaskD/Transperancy.visible = false
	$TaskD/Panel.visible = false
	$TaskD/X_button.visible = false
	$TaskD/Focus.visible = false
	$TaskD/TaskN.visible = false
	$TaskD/TaskN2.visible = false
	$TaskD/TaskN3.visible = false
	get_tree().change_scene_to_file("res://Scenes/Focus.tscn")

func _on_complete_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if(mouse_button_index == MOUSE_BUTTON_LEFT):
		task_index = index
		set_description(task_index)
		queue_redraw()
		$TaskD.visible = true
		$TaskD/Transperancy.visible = true
		$TaskD/Panel.visible = true
		$TaskD/X_button.visible = true
		$TaskD/Focus.visible = true
		$TaskD/TaskN.visible = true
		$TaskD/TaskN3.visible = true
