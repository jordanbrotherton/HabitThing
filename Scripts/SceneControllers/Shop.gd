extends Control

var index = 0

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _ready() -> void:
	$HatInfo/Transparency.visible = false
	$HatInfo/Sheet.visible = false
	$HatInfo/HatName.visible = false
	$HatInfo/Sheet/Animation.visible = false
	$HatInfo/Description.visible = false
	$HatInfo/XButton.visible = false
	$HatInfo/Left.visible = false
	$HatInfo/Right.visible = false
	for hat in ControlsData.hatDatabase:
		var a = load(hat.spritePath)
		$VBoxContainer/ScrollContainer/VBoxContainer/DueList.add_item(hat.hatName, a)

func _on_due_list_item_clicked(i: int, at_position: Vector2, mouse_button_index: int) -> void:
	if(mouse_button_index == MOUSE_BUTTON_LEFT):
		index = i
		set_hat_name(index)
		queue_redraw()
		$HatInfo/Transparency.visible = true
		$HatInfo/Sheet.visible = true
		$HatInfo/HatName.visible = true
		$HatInfo/Sheet/Animation.visible = true
		$HatInfo/Description.visible = true
		$HatInfo/XButton.visible = true
		$HatInfo/Left.visible = true
		$HatInfo/Right.visible = true

func set_hat_name(num):
	$HatInfo/HatName.text = ControlsData.hatDatabase[num - 1].hatName
	var a = load(ControlsData.hatDatabase[num - 1].spritePath)
	$HatInfo/Sheet/Animation.texture = a
	$HatInfo/Description.text = ControlsData.hatDatabase[num - 1].hatDesc

func _on_x_pressed() -> void:
	$HatInfo/Transparency.visible = false
	$HatInfo/Sheet.visible = false
	$HatInfo/HatName.visible = false
	$HatInfo/Sheet/Animation.visible = false
	$HatInfo/Description.visible = false
	$HatInfo/XButton.visible = false
	$HatInfo/Left.visible = false
	$HatInfo/Right.visible = false

func _on_right_pressed() -> void:
	if ControlsData.hatDatabase.size() <= index + 1:
		index = 0
	else:
		index += 1
	set_hat_name(index)
	queue_redraw()

func _on_left_pressed() -> void:
	if index - 1 < 0:
		index = ControlsData.hatDatabase.size() - 1
	else:
		index -= 1
	set_hat_name(index)
	queue_redraw()
