extends Sprite2D

@export var layer = 1
var speedOffset = 0.2
@onready var player = $"../Player"

func _process(delta):
	position = -player.position + layer + speedOffset
