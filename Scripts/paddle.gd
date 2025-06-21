extends CharacterBody2D
class_name Paddle

@export var paddleID: int = 1
@export var ice_block: Sprite2D
var speed: int = 10
var is_frozen: bool = false
@onready var paddleSprite: Sprite2D = $Sprite2D


func _ready() -> void:
	if (paddleID == 1):
		paddleSprite.texture = load("res://Sprites/Paddle 1.png")
	elif (paddleID == 2):
		paddleSprite.texture = load("res://Sprites/Paddle 2.png")
	else:
		printerr("The paddleID must be either 1 or 2.")

func _process(_delta: float) -> void:
	if is_frozen:
		ice_block.show()
		return
	ice_block.hide()
	if (Input.is_action_pressed("Up_" + str(paddleID))):
		global_position.y -= speed
	if (Input.is_action_pressed("Down_" + str(paddleID))):
		global_position.y += speed
	
	global_position.y = clamp(global_position.y, 80, get_viewport_rect().size.y -80)

func reset():
	global_position.y = get_viewport_rect().size.y / 2


func _on_collision_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		Global.attacking_player_id = paddleID
