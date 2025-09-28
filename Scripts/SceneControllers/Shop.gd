extends Control

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_due_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if(mouse_button_index == MOUSE_BUTTON_LEFT):
		queue_redraw()
		$HatInfo.layer.visible = true

func _ready() -> void:
	for hat in ControlsData.hatDatabase:
		var a = load(hat.spritePath)
		a.resource_path = hat.spritePath
		$VBoxContainer/ScrollContainer/VBoxContainer/DueList.add_item(hat.hatName, a)
