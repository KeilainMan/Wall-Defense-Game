extends Node2D


var enemy_1 = preload("res://scenes/enemys/green_enemy_1.tscn")
var enemy_2 = preload("res://scenes/enemys/blue_enemy_2.tscn")
var enemy_3 = preload("res://scenes/enemys/purple_enemy_3.tscn")
var enemy_4 = preload("res://scenes/enemys/red_enemy_4.tscn")
var enemy_5 = preload("res://scenes/enemys/yellow_enemy_5.tscn")
var enemy_6 = preload("res://scenes/enemys/pruple_enemy_6.tscn")
var enemy_7 = preload("res://scenes/enemys/turkise_enemy_7.tscn")
var enemy_8 = preload("res://scenes/enemys/dark_red_enemy_8.tscn")
var enemy_9 = preload("res://scenes/enemys/dark_yellow_enemy_9.tscn")
var enemy_10 = preload("res://scenes/enemys/light_grey_enemy_10.tscn")


var first_boss = preload("res://scenes/bosses/first_boss.tscn")

var bullet = preload("res://scenes/player_bullets/area_bullet.tscn")

var new_ball

var score:int = 0
var time:int = 0
var gold_amount:int = 0
var level_gold_gain 

var enemy_selection = [enemy_1]




func _ready():
	ShopStates.check_shop_states()
	Globals.hardness_adjustment()
	Enemys.reset()
	randomize()
	$Starttimer.start() #gibt Zeit bevor es losgeht
	$shooter/bullet_spawn_timer.set_wait_time(Globals.attack_speed)
	$shooter/bullet_spawn_timer.start()
	Globals.wall_health = Globals.wall_max_health
	score = 0
	print(ShopStates.state_counter)
	$HUD.hide_HUD()
	$GUI/VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/Healthbarcontainer/Healthbar.max_value = Globals.wall_max_health
	$GUI/VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/Healthbarcontainer/Healthbar.value = Globals.wall_health

func _on_Starttimer_timeout():
	$enemy_spawn_timer.start() 
	$Timekeeper.start()

func _on_enemy_spawn_timer_timeout():
	$enemy_spawn_line/enemy_spawn_position.offset = randi()
	enemy_selection.shuffle()
	var enemy_n = enemy_selection[0]
	var new_enemy = enemy_n.instance()
	add_child(new_enemy)
	new_enemy.position = $enemy_spawn_line/enemy_spawn_position.position
	new_enemy.connect("scoreupdate", self, "_scoreupdate")
	
func _scoreupdate():
	score += 1
	$GUI.update_score(score)
	increase_difficultie()
	spawn_boss()
	if score == 10:
		spawn_boss()

func increase_difficultie():
	if score % 10 == 0:
		_increase_spawnrate()
	if score % int(0.2*pow(ShopStates.state_counter,2)-6.5*ShopStates.state_counter+80) == 0:#t 16 0,2x^2-6,5x+80 ab 17 25+1/x
		Enemys.readjust_spawnable_enemys()
		copie_enemy_selection()
	
func _increase_spawnrate():
	var spawn_time = $enemy_spawn_timer.get_wait_time()
	spawn_time = spawn_time - 0.1
	if spawn_time < 0.1:
		spawn_time = 0.1
	$enemy_spawn_timer.stop()
	$enemy_spawn_timer.set_wait_time(spawn_time)
	$enemy_spawn_timer.start()
	
func _on_Timekeeper_timeout():
	time += 1
	$GUI.update_time(time)
	
func _gold_calculation():
	level_gold_gain = time + score
	Globals.gold_amount = Globals.gold_amount + level_gold_gain
	
func _reset_enemy_spawn_timer():
	$enemy_spawn_timer.set_wait_time(0.75)
		
func spawn_boss():
	if score % 100 == 0:
		$enemy_spawn_timer.stop()
		get_tree().call_group("enemys", "queue_free")
		var new_boss = first_boss.instance()
		new_boss.position = $enemy_spawn_line/enemy_spawn_position.position
		new_boss.connect("restart_timers", self, "restart_timer_after_bossfight")
		call_deferred("add_child", new_boss)

func restart_timer_after_bossfight():
	$enemy_spawn_timer.start()
	
func _end_game():
	_gold_calculation()
	$HUD.show_end_game_HUD(time, score, level_gold_gain)
	$enemy_spawn_timer.stop()
	$shooter/bullet_spawn_timer.stop()
	$Timekeeper.stop()
	Globals.reset_variables()
	get_tree().call_group("enemys", "queue_free")
	get_tree().call_group("bullets", "queue_free")
	Globals.check_highest_score(score)
	GameSave.save_game()

func copie_enemy_selection():
	enemy_selection = Enemys.spawnable_enemys.duplicate(true)
	
