extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	value = 60
	$"..".start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = $"..".get_time_left()
	pass

func timer_restart():
	value = 60
	$"..".stop()
	$"..".start()
	pass
