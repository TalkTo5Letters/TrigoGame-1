extends Node2D
var enemy_coords: PackedVector2Array = [Vector2(-200, 1210), Vector2(-25, 900),Vector2(-215, 612),Vector2(92, 323)]
var enemy_gen
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player_current_scene = get_tree().current_scene.scene_file_path
	enemy_gen = preload("res://scenes/objects/enem_gen_loop.tscn").instantiate()
	enemy_gen.enemy_coords = enemy_coords
	add_child(enemy_gen)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
