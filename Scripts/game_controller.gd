extends Node2D

var countdownAnim: AnimationPlayer
var ball: PackedScene = load("res://Scenes/ball.tscn")
signal resetPaddle

@onready var countdown_animation: Label = %"Countdown Animation"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready():
	Global.scored_goal.connect(playScoredSound)
	StartGame()

func StartGame():
	countdownAnim = get_tree().get_first_node_in_group("countdown animation")
	var paddles = get_tree().get_nodes_in_group("paddle")
	
	for paddle in paddles:
		connect("resetPaddle", paddle.reset)
	Global.P1_Score = 0
	Global.P2_Score = 0
	
	resetPaddle.emit()
	
	startNextRound()

func playScoredSound():
	audio_stream_player_2d.play()

func startNextRound():
	if (Global.P1_Score == 5 or Global.P2_Score == 5):
		call_deferred("endGame")
		return
	countdownAnim.play("countdown")
	await countdownAnim.animation_finished
	spawnBall()

func endGame():
	get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")

func spawnBall():
	var newBall = ball.instantiate()
	newBall.global_position = get_viewport().get_visible_rect().size/2
	var direction = Vector2.from_angle(randf_range(0,359))
	newBall.launch(direction)
	get_tree().root.get_child(1).add_child(newBall)
