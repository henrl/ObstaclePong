extends Label

@export var playerID: int = 1

func _process(delta: float) -> void:
	if (playerID == 1):
		text = "Red: " + str(Global.P1_Score)
	elif (playerID == 2):
		text = "Blue: " + str(Global.P2_Score)
	else:
		printerr("The Player ID of ", name, " is incorrect.")
