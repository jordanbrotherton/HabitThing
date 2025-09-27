extends Control

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")



func _on_due_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	get_tree().change_scene_to_file("res://Scenes/HatView.tscn")
