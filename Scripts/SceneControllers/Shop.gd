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
	$HatInfo/Rarity.visible = false
	$HatInfo/XButton.visible = false
	$HatInfo/Left.visible = false
	$HatInfo/Right.visible = false
	$HatInfo/Set_Default.visible = false
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
		$HatInfo/Rarity.visible = true
		$HatInfo/XButton.visible = true
		$HatInfo/Left.visible = true
		$HatInfo/Right.visible = true
		$HatInfo/Set_Default.visible = true

func set_hat_name(num):
	$HatInfo/HatName.text = ControlsData.hatDatabase[num - 1].hatName
	var a = load(ControlsData.hatDatabase[num - 1].spritePath)
	$HatInfo/Sheet/Animation.texture = a
	$HatInfo/Rarity.text = ControlsData.hatDatabase[num - 1].hatRar
	if $HatInfo/Rarity.text == "Common":
		$HatInfo/Rarity.label_settings.font_color = Color(0, 0.75, 0)
	else: if $HatInfo/Rarity.text == "Rare":
		$HatInfo/Rarity.label_settings.font_color = Color(0, 0.5, 1)
	else: if $HatInfo/Rarity.text == "Epic":
		$HatInfo/Rarity.label_settings.font_color = Color(0.5, 0, 1)
	else: if $HatInfo/Rarity.text == "Legendary":
		$HatInfo/Rarity.label_settings.font_color = Color(0.9, 0.75, 0)
	else:
		$HatInfo/Rarity.label_settings.font_color = Color()
	$HatInfo/Description.text = ControlsData.hatDatabase[num - 1].hatDesc

func _on_x_pressed() -> void:
	$HatInfo/Transparency.visible = false
	$HatInfo/Sheet.visible = false
	$HatInfo/HatName.visible = false
	$HatInfo/Sheet/Animation.visible = false
	$HatInfo/Rarity.visible = false
	$HatInfo/Description.visible = false
	$HatInfo/XButton.visible = false
	$HatInfo/Left.visible = false
	$HatInfo/Right.visible = false
	$HatInfo/Set_Default.visible = false

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

func _on_set_default_pressed() -> void:
	ControlsData.set_hats(ControlsData.hatDatabase[index - 1].spritePath)
	$HatInfo/Transparency.visible = false
	$HatInfo/Sheet.visible = false
	$HatInfo/HatName.visible = false
	$HatInfo/Sheet/Animation.visible = false
	$HatInfo/Rarity.visible = false
	$HatInfo/Description.visible = false
	$HatInfo/XButton.visible = false
	$HatInfo/Left.visible = false
	$HatInfo/Right.visible = false
	$HatInfo/Set_Default.visible = false
