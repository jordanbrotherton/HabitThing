extends Control


func _on_cancel_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")



#func _on_add_button_pressed() -> void:
	


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
