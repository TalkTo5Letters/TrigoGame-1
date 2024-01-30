extends Node2D
var enemy_data = [] #id, type, name, sprite_path
var enemy_id
var enemy_type
var enemy_name
var enemy_texture_path
# Called when the node enters the scene tree for the first time.
func _ready():
	print("gyahaha")
	enemy_id = enemy_data[0]
	enemy_type = enemy_data[1]
	enemy_name = enemy_data[2]
	enemy_texture_path = enemy_data[3]
	var enemy_texture = load(enemy_texture_path)
	$StaticBody2D/Sprite2D.set_texture(enemy_texture)
	if Global.kill_list.find(enemy_id) > -1:
		queue_free()
	Global.enemy_type = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		EventHandler.start_fight.emit(enemy_data)
	pass # Replace with function body.
