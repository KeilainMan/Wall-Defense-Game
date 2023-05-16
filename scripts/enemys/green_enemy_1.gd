extends Area2D


var enemy_health = 3

signal scoreupdate

func _ready():
	pass # Replace with function body.


func _process(delta):
	position += (Vector2.DOWN * Globals.enemy_speed)*delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group("bullets"):
		enemy_health = enemy_health - Globals.bullet_damage
	if enemy_health < 0:
		enemy_health = 0
	if enemy_health == 0:
		queue_free()
		emit_signal("scoreupdate")
