extends Area2D

onready var health 
export var max_health = 5
signal health_changed
signal game_over

func _ready():
	pass # Replace with function body.


func _on_Mauer_area_entered(area):
	area.queue_free()
	if area.is_in_group("boss"):
		Globals.wall_health = 0
	if area.is_in_group("enemys"):
		Globals.wall_health -= 1
		emit_signal("health_changed")
	if Globals.wall_health < 1 :
		Globals.wall_health = 0
		emit_signal("game_over")
