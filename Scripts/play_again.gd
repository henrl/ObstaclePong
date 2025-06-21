extends Button

func _ready() -> void:
	pressed.connect(playAgain)

func playAgain():
	if Global.has_cpu:
		get_tree().change_scene_to_file("res://Scenes/main_cpu.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
