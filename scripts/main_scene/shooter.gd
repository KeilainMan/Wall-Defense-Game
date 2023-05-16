extends Sprite


var bullet = preload("res://scenes/player_bullets/area_bullet.tscn")


func _ready():
	set_as_toplevel(true)


func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)


func _on_bullet_spawn_timer_timeout():
	shoot_bullet_center()
	if Globals.double_bullet == true:
		shoot_bullet_right()
	if Globals.tripple_bullet == true:
		shoot_bullet_left() 


func shoot_bullet_center():
	var new_bullet_1 = bullet.instance()
	new_bullet_1.rotation = rotation
	var temp_pos = new_bullet_1.rotation
	new_bullet_1.position = $bullet_spawn_position.position
	new_bullet_1.scale.x = Globals.bullet_size
	new_bullet_1.scale.y = Globals.bullet_size
	get_parent().add_child(new_bullet_1)
	if Globals.second_bullet == true:
		yield(get_tree().create_timer(0.03),"timeout")	
		second_bullet(temp_pos)
	if Globals.third_bullet == true:
		yield(get_tree().create_timer(0.03),"timeout")
		third_bullet(temp_pos)
	
func shoot_bullet_right():
	var new_bullet_2 = bullet.instance()
	new_bullet_2.rotation = rotation + PI / 24
	var temp_pos = new_bullet_2.rotation
	new_bullet_2.position = $bullet_spawn_position.position
	new_bullet_2.scale.x = Globals.bullet_size
	new_bullet_2.scale.y = Globals.bullet_size
	get_parent().add_child(new_bullet_2) 
	if Globals.second_bullet == true:
		yield(get_tree().create_timer(0.03),"timeout")
		second_bullet(temp_pos)
	if Globals.third_bullet == true:
		yield(get_tree().create_timer(0.03),"timeout")
		third_bullet(temp_pos)
	
func shoot_bullet_left():
	var new_bullet_3 = bullet.instance()
	new_bullet_3.rotation = rotation - PI / 24
	var temp_pos = new_bullet_3.rotation
	new_bullet_3.position = $bullet_spawn_position.position
	new_bullet_3.scale.x = Globals.bullet_size
	new_bullet_3.scale.y = Globals.bullet_size
	get_parent().add_child(new_bullet_3)
	if Globals.second_bullet == true:
		yield(get_tree().create_timer(0.03),"timeout")
		second_bullet(temp_pos)
	if Globals.third_bullet == true:
		yield(get_tree().create_timer(0.03),"timeout")
		third_bullet(temp_pos)

func second_bullet(pos):
	var new_bullet_1 = bullet.instance()
	new_bullet_1.rotation = pos
	new_bullet_1.position = $bullet_spawn_position.position
	new_bullet_1.scale.x = Globals.bullet_size
	new_bullet_1.scale.y = Globals.bullet_size
	get_parent().add_child(new_bullet_1)
	
func third_bullet(pos):
	var new_bullet_1 = bullet.instance()
	new_bullet_1.rotation = pos
	new_bullet_1.position = $bullet_spawn_position.position
	new_bullet_1.scale.x = Globals.bullet_size
	new_bullet_1.scale.y = Globals.bullet_size
	get_parent().add_child(new_bullet_1)
