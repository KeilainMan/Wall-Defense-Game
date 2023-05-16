extends RigidBody2D


var enemy_health = 75

var dir = Vector2.DOWN
var speed = 100

var boss_childs:Array 

signal scoreupdate
signal restart_timers

func _ready():
	set_contact_monitor(true)
	boss_childs = Enemys.spawnable_boss_childs.duplicate(true)

func _integrate_forces(state):
	state.linear_velocity = dir * speed

func _on_Area2D_area_entered(area):
	enemy_health = enemy_health - Globals.bullet_damage
	#area.queue_free()
	if enemy_health < 0:
		enemy_health = 0
	if enemy_health == 0:
		queue_free()
		on_destruction()
		emit_signal("scoreupdate")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func on_destruction():
	var temp = 0
	while temp < 10:
		temp += 1
		spawn_boss_childs()
	emit_signal("restart_timers")
		
func spawn_boss_childs():
	boss_childs.shuffle()
	var boss_child = boss_childs[0].instance()
	var boss_pos = $Area2D/Position2D.get_global_position()
	boss_child.position.x = boss_pos.x + rand_range(500, -500)
	boss_child.position.y = boss_pos.y + rand_range(150, -200)
	$"..".call_deferred("add_child", boss_child)
	boss_child.connect("scoreupdate", self, "_scoreupdate")

	
	
