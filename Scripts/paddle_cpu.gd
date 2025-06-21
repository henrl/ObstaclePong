extends Paddle
class_name PaddleCpu

var destination: Vector2

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if (destination != Vector2.ZERO and destination.y != global_position.y):
		global_position.y = destination.y
	global_position.y = clamp(global_position.y, 80, get_viewport_rect().size.y -80)
