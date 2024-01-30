extends Node2D
var enemy_coords: PackedVector2Array 
var enemy_names = ["Gyahaha", "Yokoso", "Kira Kira", "Doki Doki", "ShibuyasKanon", "YourWorstNightmare"]
var enemy_texture_paths = ["res://graphics/enemies/dice_spike.png", "res://graphics/enemies/pyramid.png","res://graphics/enemies/richard_diamond.png","res://graphics/enemies/spikes.png","res://graphics/enemies/tall_pyramid.png"]
var num
var rgen = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var unique_id
	num = 0 #dedicated ids for this level 1-100
	for i in enemy_coords:
		num += 1
		if num > 100:
			break
		var enemy_gen = preload("res://scenes/objects/enemy_gen.tscn").instantiate()
		var rng = rgen.randi_range(0, enemy_names.size() - 1)
		var enemy_sprite_rng = rgen.randi_range(0,  enemy_texture_paths.size() - 1)
		var enemy_sprite =  enemy_texture_paths[enemy_sprite_rng]
		var enemy_data = []
		var enemy_id = num
		var enemy_name = enemy_names[rng]
		var enemy_type = 1
		enemy_data.append(enemy_id)
		enemy_data.append(enemy_type)
		enemy_data.append(enemy_name)
		enemy_data.append(enemy_sprite)
		enemy_gen.enemy_data = enemy_data
		enemy_gen.position = i
		add_child(enemy_gen)
		print("yokoso")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
