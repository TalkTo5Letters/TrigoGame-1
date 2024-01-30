extends Area2D
@onready var player = $"../Player"
@export var fog : PointLight2D
@onready var player_cam = $"../Player/Camera2D"
@export var shit : Vector2 


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	player_cam.position_smoothing_enabled = false
	fog.fog_out()
	await get_tree().create_timer(1).timeout
	player.position += Vector2(shit)
	fog.fog_in()
	player_cam.position_smoothing_enabled = true 
	
		


