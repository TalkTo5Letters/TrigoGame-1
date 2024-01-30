extends CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	var Global = get_node("/root/Global")
	position = Global.player_last_pos
	print(position)
	var EvHand = get_node("/root/EventHandler")
	EvHand.start_fight.connect(start_fight_scene.bind())
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta): 
	pass

func start_fight_scene(enemy_data):
		var Global = get_node("/root/Global")
		Global.current_enemy_data = enemy_data
		print(position)
		Global.player_last_pos = position
		get_tree().change_scene_to_file("res://scenes/fight_events/normal_fight_event.tscn")
