extends Control

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_due_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	queue_redraw()
	$HatInfo.layer.visible = true

func _on_due_list_ready() -> void:
	for hat in ControlsData.hatDatabase:
		$DueList.add_item(hat.name, load(hat.spritePath))
