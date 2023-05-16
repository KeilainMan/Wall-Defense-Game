extends Area2D

signal enemy_collision

func _ready():
	set_as_toplevel(true)


func _process(delta):
	#var mouse_pos = Vector2($"../bullet_spawn_position".get_local_mouse_position())
	#mouse_pos = mouse_pos / mouse_pos.length()
	position += (Vector2.RIGHT*Globals.bullet_speed).rotated(rotation)*delta 
	
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func _on_Area2D_area_entered(area):
	if area.is_in_group("enemys"):
		queue_free()
		
