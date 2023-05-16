extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func upgrade_health():
	Globals.wall_max_health = Globals.wall_max_health + 5
	
func upgrade_attack_speed():
	Globals.attack_speed = Globals.attack_speed - 0.15

func upgrade_bullet_speed():
	Globals.bullet_speed = Globals.bullet_speed + 250
	
func upgrade_bullet_damage():
	Globals.bullet_damage = Globals.bullet_damage + 0.666667
	
func upgrade_bullet_size():
	Globals.bullet_size = Globals.bullet_size + 0.2
	
func double_bullet():
	Globals.double_bullet = true
	
func tripple_bullet():
	Globals.tripple_bullet = true
	
func second_bullet():
	Globals.second_bullet = true
	
func third_bullet():
	Globals.third_bullet = true
		
