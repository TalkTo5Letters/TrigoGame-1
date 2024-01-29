extends Control
var text
func _ready():
	set_mouse_filter(2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	$Label.text = text
	global_position = Vector2(mouse_pos.x - 60, mouse_pos.y)
	if Input.is_action_just_released("left_mouse"):
		queue_free()
