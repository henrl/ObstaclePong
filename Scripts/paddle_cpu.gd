extends Paddle
class_name PaddleCpu

var destination: Vector2

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if (destination == Vector2.ZERO):
		return
	var error_margin = randf_range(-100, 100)
	if (destination.y > global_position.y + error_margin):
		global_position.y += speed
	elif (destination.y < global_position.y + error_margin):
		global_position.y -= speed
	global_position.y = clamp(global_position.y, 80, get_viewport_rect().size.y -80)

func reset():
	destination = Vector2.ZERO
	super.reset()
