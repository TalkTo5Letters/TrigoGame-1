extends Node2D
var emitter
var quest_data
var rgen = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	emitter = get_node("/root/EventHandler")
	emitter.answer_state.connect(check_answer_state.bind())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_answer_state(state):
	$"../Timer".set_paused(true)
	var damage = int(quest_data.get("damage"))
	if state == true:
		print($"../enemy_stat/TextureProgressBar".value )
		$"../enemy_stat/TextureProgressBar".value -= damage
		if $"../enemy_stat/TextureProgressBar".value <= 0:
			Global.enemy_killed = true
			kill_enemy()
		else:
			$"../TextPanel/Label".text = "Correct Answer"
			Input.mouse_mode = 2
			await get_tree().create_timer(1).timeout
			Input.mouse_mode = 0
			$"..".reload()
	if state == false:
		wrong_ans()
	

func kill_enemy():
	var enemy_id = $"..".enemy_id
	Global.kill_list.append(enemy_id)
	print(Global.kill_list)
	$"../TextPanel/Label".text = "Enemy Killed!"
	Input.mouse_mode = 2
	await get_tree().create_timer(2).timeout
	Input.mouse_mode = 0
	get_tree().change_scene_to_file(Global.player_current_scene)

func wrong_ans():
	var rng = rgen.randi_range(20, 40)
	$"../TextPanel/Label".text = "Wrong answer!"
	Global.hp -= rng
	$"../player_hp".value = Global.hp
	if $"../player_hp".value <= 0:
		die()
	else:
		Input.mouse_mode = 2
		await get_tree().create_timer(2).timeout
		Input.mouse_mode = 0
		$"..".reload()

func _on_timer_timeout():
	$"../TextPanel/Label".text = "Ran out of time!"
	var rng = rgen.randi_range(5, 20)
	Global.hp -= rng
	$"../player_hp".value = Global.hp
	Input.mouse_mode = 2
	await get_tree().create_timer(2).timeout
	Input.mouse_mode = 0
	$"..".reload()

func die():
	Global.player_last_pos = Global.spawnpoint
	Global.kill_list = []
	Global.hp = 100
	$"../TextPanel/Label".text = "You died!"
	Input.mouse_mode = 2
	await get_tree().create_timer(2).timeout
	Input.mouse_mode = 0
	get_tree().change_scene_to_file(Global.player_current_scene)

	
