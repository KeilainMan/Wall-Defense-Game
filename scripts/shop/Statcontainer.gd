extends MarginContainer


onready var healthstat_label = get_node("VBoxContainer/HBoxContainer/Healthstatlabel")
onready var attackspeedstat_label = get_node("VBoxContainer/HBoxContainer2/AttackSpeedstatlabel")
onready var damagestat_label = get_node("VBoxContainer/HBoxContainer3/Damagestatlabel")
onready var bulletspeed_label = get_node("VBoxContainer/HBoxContainer4/BulletSpeedstatlabel")
onready var bulletsize_label = get_node("VBoxContainer/HBoxContainer5/BulletSizestatlabel")
onready var bulletsinarow_label = get_node("VBoxContainer/HBoxContainer6/BulletsInARowstatlabel")
onready var bulletsinaline_label = get_node("VBoxContainer/HBoxContainer7/BulletsinALinestatlabel")


func _ready():
	update_stats()


func update_stats():
	healthstat_label.text = str(Globals.wall_max_health)
	attackspeedstat_label.text = str(Globals.attack_speed)
	damagestat_label.text = str(Globals.bullet_damage)
	bulletspeed_label.text = str(Globals.bullet_speed)
	bulletsize_label.text = str(Globals.bullet_size)
	if ShopStates.double_bullet == true:
		bulletsinarow_label.text = str(2)
		if ShopStates.tripple_bullet == true:
			bulletsinarow_label.text = str(3)
	else:
		bulletsinarow_label.text = str(1)
	if ShopStates.second_bullet == true:
		bulletsinaline_label.text = str(2)
		if ShopStates.third_bullet == true:
			bulletsinaline_label.text = str(3)
	else:
		bulletsinaline_label.text = str(1)
