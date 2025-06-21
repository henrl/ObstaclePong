extends Node

@export var timer: Timer
var freeze_powerup_scene: PackedScene = load("res://Scenes/freeze_powerup.tscn")
var speed_powerup_scene: PackedScene = load("res://Scenes/speed_powerup.tscn")
@onready var spawn_positions: Node = $SpawnPositions

func _ready() -> void:
	timer.timeout.connect(spawn_powerup)

func spawn_powerup():
	var spawn_index = randi() % spawn_positions.get_child_count()
	var spawn_marker = spawn_positions.get_child(spawn_index)
	if spawn_marker.get_child_count() <= 0:
		spawn_marker.add_child(choose_powerup())

func choose_powerup() -> Node:
	var coin_flip = randi() % 2
	if coin_flip == 0:
		return freeze_powerup_scene.instantiate()
	return speed_powerup_scene.instantiate()
	
