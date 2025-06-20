extends CharacterBody2D

var speed: int = 500
@onready var audioPlayer: AudioStreamPlayer2D = $AudioStreamPlayer2D

func launch(direction: Vector2):
	velocity = direction * speed

func _process(delta):
	var collision = move_and_collide(velocity*delta)
	if (collision):
		audioPlayer.play()
		velocity = velocity.bounce(collision.get_normal())
