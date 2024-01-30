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
	var damage = int(quest_data.get("damage"))
	if state == true:
		print($"../enemy_stat/TextureProgressBar".value )
		$"../enemy_stat/TextureProgressBar".value -= damage
		if $"../enemy_stat/TextureProgressBar".value <= 0:
			kill_enemy()
			return
		else:
			$"..".reload()
	if state == false:
		wrong_ans()
	

func kill_enemy():
	$"../TextPanel/Label".text = "Enemy Killed!"
	await get_tree().create_timer(5).timeout
	KillList.level1[Global.current_enemy] = true
	print(KillList.level1.get(Global.current_enemy))
	print(Global.player_current_scene)
	get_tree().change_scene_to_file(Global.player_current_scene)

func wrong_ans():
	var rng = rgen.randi_range(5, 20)
	$"../TextPanel/Label".text = "Wrong answer!"
	Global.hp -= rng
	$"../player_hp".value = Global.hp
	await get_tree().create_timer(2).timeout
	$"..".reload()

func _on_timer_timeout():
	$"../TextPanel/Label".text = "Ran out of time!"
	var rng = rgen.randi_range(5, 20)
	Global.hp -= rng
	$"../player_hp".value = Global.hp
	await get_tree().create_timer(2).timeout
	$"..".reload()
