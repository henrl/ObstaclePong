extends Area2D

@export var GoalID: int = 0

func _ready():
	body_entered.connect(scored)

func scored(body):
	if (body.is_in_group("ball")):
		Global.scored_goal.emit()
		if (GoalID == 1):
			Global.P2_Score += 1
		if (GoalID == 2):
			Global.P1_Score += 1
		body.queue_free()
		owner.startNextRound()
