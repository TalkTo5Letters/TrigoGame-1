extends Node2D
var player_spawn = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.first_boot == true:
		Global.hp = 100
		Global.first_boot == false
	position = Global.player_last_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
