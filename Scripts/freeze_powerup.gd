extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		if Global.attacking_player_id == 1:
			Global.freezePlayer.emit(2)
		elif Global.attacking_player_id == 2:
			Global.freezePlayer.emit(1)
		queue_free()
