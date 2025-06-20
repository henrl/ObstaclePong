extends MarginContainer


func _on_play_button_pressed() -> void:
	Global.start_game.emit()
