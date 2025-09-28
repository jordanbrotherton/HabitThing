extends Control


func _on_add_clicked() -> void:
	get_tree().change_scene_to_file("res://Scenes/TaskMaker.tscn")


func _on_shop_clicked() -> void:
	get_tree().change_scene_to_file("res://Scenes/Shop.tscn")


func _on_stats_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Stats.tscn")
