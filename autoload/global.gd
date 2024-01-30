extends Node

var player_level1_pos = Vector2.ZERO
var player_current_scene 
var enemy_type
var current_enemy
var first_boot
var hp = 100
var enemy_killed = false
var kill_list = []
var current_enemy_data
var spawnpoint = Vector2(-8, 1234)
var player_last_pos = spawnpoint
