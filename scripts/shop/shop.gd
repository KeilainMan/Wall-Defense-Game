extends Control

onready var health_label = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer3/VBoxContainer2/HBoxContainer/Label
onready var attack_speed_label = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer4/VBoxContainer2/HBoxContainer/Label
onready var damage_label = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer5/VBoxContainer2/HBoxContainer/Label
onready var bullet_speed_label = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer6/VBoxContainer2/HBoxContainer/Label
onready var bullet_size_label = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer7/VBoxContainer2/HBoxContainer/Label
onready var bullet_up_label = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer8/VBoxContainer2/HBoxContainer/Label
onready var plus1_bullet_label = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer9/VBoxContainer2/HBoxContainer/Label

onready var health_button = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer3/Health
onready var attack_speed_button = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer4/Attack_Speed
onready var damage_button = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer5/Damage
onready var bullet_speed_button = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer6/Bullet_Speed
onready var bullet_size_button = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer7/Bullet_Size
onready var bullet_up_button = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer8/Bullet_UP
onready var plus1_bullet_button = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer9/plus1_Bullet

var tier_1_gold = 1
var tier_2_gold = 2
var tier_3_gold = 3

func _ready():
	$shop_gold/NinePatchRect/HBoxContainer/goldlabel.text = str(Globals.gold_amount)
	shop_initialization()
	

func shop_initialization():
	if ShopStates.health_1 == true:
		show_tier_2_gold(health_label)
		if ShopStates.health_2 == true:
			show_tier_3_gold(health_label)
			if ShopStates.health_3 == true:
				health_button.disabled = true
				var node = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer3/VBoxContainer2/TextureRect
				change_disabled_modulation(node)
	else:
		show_tier_1_gold(health_label)
	if ShopStates.attack_speed_1 == true:
		show_tier_2_gold(attack_speed_label)
		if ShopStates.attack_speed_2 == true:
			show_tier_3_gold(attack_speed_label)
			if ShopStates.attack_speed_3 == true:
				attack_speed_button.disabled = true
				var node = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer4/VBoxContainer2/TextureRect
				change_disabled_modulation(node)
	if ShopStates.bullet_damage_1 == true:
		show_tier_2_gold(damage_label)
		if ShopStates.bullet_damage_2 == true:
			show_tier_3_gold(damage_label)
			if ShopStates.bullet_damage_3 == true:
				damage_button.disabled = true
				var node = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer5/VBoxContainer2/TextureRect
				change_disabled_modulation(node)
	if ShopStates.bullet_speed_1 == true:
		show_tier_2_gold(bullet_speed_label)
		if ShopStates.bullet_speed_2 == true:
			show_tier_3_gold(bullet_speed_label)
			if ShopStates.bullet_speed_3 == true:
				bullet_speed_button.disabled = true
				var node = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer6/VBoxContainer2/TextureRect
				change_disabled_modulation(node)
	if ShopStates.bullet_size_1 == true:
		show_tier_2_gold(bullet_size_label)
		if ShopStates.bullet_size_2 == true:
			show_tier_3_gold(bullet_size_label)
			if ShopStates.bullet_size_3 == true:
				bullet_size_button.disabled = true
				var node = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer7/VBoxContainer2/TextureRect
				change_disabled_modulation(node)
	if ShopStates.double_bullet == false:
		show_tier_2_gold(bullet_up_label)
	if ShopStates.double_bullet == true:
		show_tier_3_gold(bullet_up_label)
		if ShopStates.tripple_bullet == true:
			bullet_up_button.disabled = true
			var node = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer8/VBoxContainer2/TextureRect
			change_disabled_modulation(node)
	if ShopStates.second_bullet == false:
		show_tier_2_gold(plus1_bullet_label)
	if ShopStates.second_bullet == true:
		show_tier_3_gold(plus1_bullet_label)
		if ShopStates.third_bullet == true:
			plus1_bullet_button.disabled = true
			var node = $Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer9/VBoxContainer2/TextureRect
			change_disabled_modulation(node)
				
func change_disabled_modulation(node):
	node.set_modulate(Color(0.2,0.2,0.2))
	

func show_tier_1_gold(label):
	label.text = str(tier_1_gold)
	

func show_tier_2_gold(label):
	label.text = str(tier_2_gold)
	
	
func show_tier_3_gold(label):
	label.text = str(tier_3_gold)
	
func tier_1_purchase():
	Globals.gold_amount = Globals.gold_amount - tier_1_gold
	$Statcontainer.update_stats()
	
func tier_2_purchase():
	Globals.gold_amount = Globals.gold_amount - tier_2_gold
	$Statcontainer.update_stats()
	
func tier_3_purchase():
	Globals.gold_amount = Globals.gold_amount - tier_3_gold
	$Statcontainer.update_stats()

func _on_Health_pressed():
	if ShopStates.health_2 == true:
		if Globals.gold_amount >= tier_3_gold:
			ShopStates.health_3 = true
			print(ShopStates.health_3)
			tier_3_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer3/Health.disabled = true
	elif ShopStates.health_1 == true:
		if Globals.gold_amount >= tier_2_gold:
			ShopStates.health_2 = true
			tier_2_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer3/VBoxContainer2/HBoxContainer/Label.text = str(tier_3_gold)
	elif Globals.gold_amount >= tier_1_gold:
		ShopStates.health_1 = true
		tier_1_purchase()
		$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer3/VBoxContainer2/HBoxContainer/Label.text = str(tier_2_gold)
	else:
		print("das funktioniert nicht")
	$shop_gold/NinePatchRect/HBoxContainer/goldlabel.text = str(Globals.gold_amount)	


func _on_Attack_Speed_pressed():
	if ShopStates.attack_speed_2 == true:
		if Globals.gold_amount >= tier_3_gold:
			ShopStates.attack_speed_3 = true
			tier_3_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer4/Attack_Speed.disabled = true
	elif ShopStates.attack_speed_1 == true:
		if Globals.gold_amount >=tier_2_gold:
			ShopStates.attack_speed_2 = true
			tier_2_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer4/VBoxContainer2/HBoxContainer/Label.text = str(tier_3_gold)
	elif Globals.gold_amount >= tier_1_gold:
		ShopStates.attack_speed_1 = true
		tier_1_purchase()
		$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer4/VBoxContainer2/HBoxContainer/Label.text = str(tier_2_gold)
	else:
		print("das funktioniert nicht")
	$shop_gold/NinePatchRect/HBoxContainer/goldlabel.text = str(Globals.gold_amount)


func _on_Bullet_Speed_pressed():
	if ShopStates.bullet_speed_2 == true:
		if Globals.gold_amount >= tier_3_gold:
			ShopStates.bullet_speed_3 = true
			tier_3_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer6/Bullet_Speed.disabled = true
	elif ShopStates.bullet_speed_1 == true:
		if Globals.gold_amount >= tier_2_gold:
			ShopStates.bullet_speed_2 = true
			tier_2_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer6/VBoxContainer2/HBoxContainer/Label.text = str(tier_3_gold)
	elif Globals.gold_amount >= tier_1_gold:
		ShopStates.bullet_speed_1 = true
		tier_1_purchase()
		$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer6/VBoxContainer2/HBoxContainer/Label.text = str(tier_2_gold)
	else:
		print("das funktioniert nicht")
	$shop_gold/NinePatchRect/HBoxContainer/goldlabel.text = str(Globals.gold_amount)


func _on_Damage_pressed():
	if ShopStates.bullet_damage_2 == true:
		if Globals.gold_amount >= tier_3_gold:
			ShopStates.bullet_damage_3 = true
			tier_3_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer5/Damage.disabled = true
	elif ShopStates.bullet_damage_1 == true:
		if Globals.gold_amount >= tier_2_gold:
			ShopStates.bullet_damage_2 = true
			tier_2_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer5/VBoxContainer2/HBoxContainer/Label.text = str(tier_3_gold)
	elif Globals.gold_amount >= tier_1_gold:
		ShopStates.bullet_damage_1 = true
		tier_1_purchase()
		$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer5/VBoxContainer2/HBoxContainer/Label.text = str(tier_2_gold)
	else:
		print("das funktioniert nicht")
	$shop_gold/NinePatchRect/HBoxContainer/goldlabel.text = str(Globals.gold_amount)
	

func _on_Bullet_Size_pressed():
	if ShopStates.bullet_size_2 == true:
		if Globals.gold_amount >= tier_3_gold:
			ShopStates.bullet_size_3 = true
			tier_3_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer7/Bullet_Size.disabled = true
	elif ShopStates.bullet_size_1 == true:
		if Globals.gold_amount >= tier_2_gold:
			ShopStates.bullet_size_2 = true
			tier_2_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer7/VBoxContainer2/HBoxContainer/Label.text = str(tier_3_gold)
	elif Globals.gold_amount >= tier_1_gold:
		ShopStates.bullet_size_1 = true
		tier_1_purchase()
		$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer7/VBoxContainer2/HBoxContainer/Label.text = str(tier_2_gold)
	else:
		print("das funktioniert nicht")
	$shop_gold/NinePatchRect/HBoxContainer/goldlabel.text = str(Globals.gold_amount)


func _on_Bullet_UP_pressed():
	if ShopStates.double_bullet == true:
		if Globals.gold_amount >= tier_3_gold:
			tier_3_purchase()
			ShopStates.tripple_bullet = true
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer8/Bullet_UP.disabled = true
	elif Globals.gold_amount >= tier_2_gold:
		tier_2_purchase()
		ShopStates.double_bullet = true
		$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer8/VBoxContainer2/HBoxContainer/Label.text = str(tier_2_gold)


func _on_plus1_Bullet_pressed():
	if ShopStates.second_bullet == true:
		if Globals.gold_amount >= tier_3_gold:
			ShopStates.third_bullet = true
			tier_3_purchase()
			$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer9/plus1_Bullet.disabled = true
	elif Globals.gold_amount >= tier_2_gold:
		ShopStates.second_bullet = true
		tier_2_purchase()
		$Shopmargain/MarginContainer/ScrollContainer/GridContainer/MarginContainer9/VBoxContainer2/HBoxContainer/Label.text = str(tier_2_gold)


func _on_Backbutton_pressed():
	GameSave.save_game()
	get_tree().change_scene("res://scenes/main_ui/Main_UI.tscn")
