extends Node2D

func _ready():
	if Global.first_boot == true:
		Global.player_last_pos = Global.spawnpoint
		Global.hp = 100
	else:
		Global.first_boot == false
	print(Global.first_boot)
	$"../Player".position = Global.player_last_pos
