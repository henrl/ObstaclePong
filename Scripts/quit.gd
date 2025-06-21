extends Button

func _ready() -> void:
	pressed.connect(quit)

func quit():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
