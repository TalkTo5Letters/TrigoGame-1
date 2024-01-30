extends Control
var text = "gyahaha"
var answer
# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect/Label.text = text
	$TextureRect/Label.set_horizontal_alignment(1)
	$TextureRect.text = text
	$TextureRect.answer = answer
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


