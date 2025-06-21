extends Node2D
class_name GameManager

@export var has_cpu: bool = false
var countdownAnim: AnimationPlayer
var ball_scene: PackedScene = load("res://Scenes/ball.tscn")
var ball_in_play: Node
var cpu_paddle: PaddleCpu
signal resetPaddle

@onready var countdown_animation: Label = %"Countdown Animation"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready():
	Global.scored_goal.connect(playScoredSound)
	if has_cpu:
		cpu_paddle = get_tree().get_first_node_in_group("cpu")
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
	ball_in_play = ball_scene.instantiate()
	ball_in_play.global_position = get_viewport().get_visible_rect().size/2
	var direction = Vector2.from_angle(randf_range(0,359))
	ball_in_play.launch(direction)
	get_tree().root.get_child(1).add_child(ball_in_play)

func _physics_process(delta: float) -> void:
	if has_cpu and ball_in_play != null:
		cpu_paddle.destination = ball_in_play.global_position
