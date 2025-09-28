extends Control

func _on_return_to_main_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
