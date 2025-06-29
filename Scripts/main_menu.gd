extends CanvasLayer


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/controls.tscn")


func _on_player_pressed() -> void:
	Global.has_cpu = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_cpu_player_pressed() -> void:
	Global.has_cpu = true
	get_tree().change_scene_to_file("res://Scenes/main_cpu.tscn")
