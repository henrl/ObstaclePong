extends Button

func _ready() -> void:
	pressed.connect(playAgain)

func playAgain():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
