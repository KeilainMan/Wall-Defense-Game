extends Node

var state_counter = 0

var health_1 = false
var health_2 = false
var health_3 = false
var attack_speed_1 = false
var attack_speed_2 = false
var attack_speed_3 = false
var bullet_speed_1 = false
var bullet_speed_2 = false
var bullet_speed_3 = false
var bullet_damage_1 = false
var bullet_damage_2 = false
var bullet_damage_3 = false
var bullet_size_1 = false
var bullet_size_2 = false
var bullet_size_3 = false

var double_bullet = false
var tripple_bullet = false
var second_bullet = false
var third_bullet = false

func _ready():
	pass # Replace with function body.


func check_shop_states():
	var shop_states = {
	"health_1": health_1,
	"health_2": health_2,
	"health_3": health_3,
	"attack_speed_1": attack_speed_1,
	"attack_speed_2": attack_speed_2,
	"attack_speed_3": attack_speed_3,
	"bullet_speed_1": bullet_speed_1,
	"bullet_speed_2": bullet_speed_2,
	"bullet_speed_3": bullet_speed_3,
	"bullet_damage_1": bullet_damage_1,
	"bullet_damage_2": bullet_damage_2,
	"bullet_damage_3": bullet_damage_3,
	"bullet_size_1": bullet_size_1,
	"bullet_size_2": bullet_size_2,
	"bullet_size_3": bullet_size_3,
	
	"double_bullet": double_bullet,
	"tripple_bullet": tripple_bullet,
	"second_bullet": second_bullet,
	"third_bullet": third_bullet,
	
}

	for i in shop_states.keys():
		if shop_states.get(i) == true:
			state_counter += 1
		if i == "health_1" and shop_states.get(i) == true:
			ShopFunctions.upgrade_health()
		elif i == "health_2" and shop_states.get(i) == true:
			ShopFunctions.upgrade_health()
		elif i == "health_3" and shop_states.get(i) == true:
			ShopFunctions.upgrade_health()
		elif i == "attack_speed_1" and shop_states.get(i) == true:
			ShopFunctions.upgrade_attack_speed()
		elif i == "attack_speed_2" and shop_states.get(i) == true:
			ShopFunctions.upgrade_attack_speed()
		elif i == "attack_speed_3" and shop_states.get(i) == true:
			ShopFunctions.upgrade_attack_speed()
		elif i == "bullet_speed_1" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_speed()
		elif i == "bullet_speed_2" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_speed()
		elif i == "bullet_speed_3" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_speed()
		elif i == "bullet_damage_1" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_damage()
		elif i == "bullet_damage_2" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_damage()
		elif i == "bullet_damage_3" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_damage()
		elif i == "bullet_size_1" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_size()
		elif i == "bullet_size_2" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_size()
		elif i == "bullet_size_3" and shop_states.get(i) == true:
			ShopFunctions.upgrade_bullet_size()
		elif i == "double_bullet" and shop_states.get(i) == true:
			ShopFunctions.double_bullet()
		elif i == "tripple_bullet" and shop_states.get(i) == true:
			ShopFunctions.tripple_bullet()
		elif i == "second_bullet" and shop_states.get(i) == true:
			ShopFunctions.second_bullet()
		elif i == "third_bullet" and shop_states.get(i) == true:
			ShopFunctions.third_bullet()
