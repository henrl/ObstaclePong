extends Paddle
class_name PaddleCpu

var destination: Vector2

func _process(_delta: float) -> void:
	if is_frozen:
		ice_block.show()
		return
	ice_block.hide()

func _physics_process(delta: float) -> void:
	if (destination == Vector2.ZERO || is_frozen):
		return
	var error_margin = randf_range(-100, 100)
	if (destination.y > global_position.y + error_margin):
		global_position.y = lerp(global_position.y, global_position.y + speed, 5 *speed * delta)
	elif (destination.y < global_position.y + error_margin):
		global_position.y = lerp(global_position.y, global_position.y - speed, 5 * speed * delta)
	global_position.y = clamp(global_position.y, 80, get_viewport_rect().size.y -80)

func reset():
	destination = Vector2.ZERO
	super.reset()
