extends Node


var highest_score = 0

var enemy_speed = 150

var gold_amount = 0
var wall_health 
var wall_max_health = 5
var attack_speed = 0.5
var bullet_speed = 600
var bullet_damage = 1
var bullet_size = 0.5

var double_bullet = false
var tripple_bullet = false
var second_bullet = false
var third_bullet = false

func _ready():
	pass # Replace with function body.


func reset_variables():
	wall_max_health = 5
	attack_speed = 0.5
	bullet_speed = 600
	bullet_damage = 1
	bullet_size = 0.5
	double_bullet = false
	tripple_bullet = false
	second_bullet = false
	third_bullet = false
	ShopStates.state_counter = 0
	
func check_highest_score(score):
	if score > highest_score:
		highest_score = score
		
func hardness_adjustment():
	enemy_speed = enemy_speed + 10 * ShopStates.state_counter
