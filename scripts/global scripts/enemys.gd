extends Node


onready var enemy_1 = preload("res://scenes/enemys/green_enemy_1.tscn")
onready var enemy_2 = preload("res://scenes/enemys/blue_enemy_2.tscn")
onready var enemy_3 = preload("res://scenes/enemys/purple_enemy_3.tscn")
onready var enemy_4 = preload("res://scenes/enemys/red_enemy_4.tscn")
onready var enemy_5 = preload("res://scenes/enemys/yellow_enemy_5.tscn")
onready var enemy_6 = preload("res://scenes/enemys/pruple_enemy_6.tscn")
onready var enemy_7 = preload("res://scenes/enemys/turkise_enemy_7.tscn")
onready var enemy_8 = preload("res://scenes/enemys/dark_red_enemy_8.tscn")
onready var enemy_9 = preload("res://scenes/enemys/dark_yellow_enemy_9.tscn")
onready var enemy_10 = preload("res://scenes/enemys/light_grey_enemy_10.tscn")

onready var all_enemys:Array = [enemy_1,
								enemy_2,
								enemy_3,
								enemy_4,
								enemy_5,
								enemy_6,
								enemy_7,
								enemy_8,
								enemy_9,
								enemy_10
								]

onready var spawnable_enemys:Array = [enemy_1]
onready var spawnable_boss_childs:Array = [enemy_1]
onready var all_enemys_copie = all_enemys.duplicate(false)





func _ready():
	pass
	
func reset():
	all_enemys_copie = all_enemys.duplicate(true)
	all_enemys_copie.invert()

func readjust_spawnable_enemys():
	for i in all_enemys_copie.size() -1:
		if !spawnable_enemys.has(all_enemys_copie[i]):
			if spawnable_enemys.has(all_enemys_copie[i+1]):
				print("hi")
				spawnable_enemys.append(all_enemys_copie[i])
				if !spawnable_boss_childs.has(all_enemys_copie[i]):
					spawnable_boss_childs.append(all_enemys_copie[i])
				spawnable_boss_childs.append(all_enemys_copie[i-1])
				all_enemys_copie.pop_back()
				print(spawnable_enemys)
				if spawnable_enemys.size() > 4:
					spawnable_enemys.pop_front()
				if spawnable_boss_childs.size()>4:
					spawnable_boss_childs.pop_front()
