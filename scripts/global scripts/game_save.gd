extends Node



func _ready():
	pass # Replace with function body.

func save_game():
	var save_stats={
		"Gold": Globals.gold_amount,
		"highest_score": Globals.highest_score,
		"health_1": ShopStates.health_1,
		"health_2": ShopStates.health_2,
		"health_3": ShopStates.health_3,
		"attack_speed_1": ShopStates.attack_speed_1,
		"attack_speed_2": ShopStates.attack_speed_2,
		"attack_speed_3": ShopStates.attack_speed_3,
		"bullet_speed_1": ShopStates.bullet_speed_1,
		"bullet_speed_2": ShopStates.bullet_speed_2,
		"bullet_speed_3": ShopStates.bullet_speed_3,
		"bullet_damage_1": ShopStates.bullet_damage_1,
		"bullet_damage_2": ShopStates.bullet_damage_2,
		"bullet_damage_3": ShopStates.bullet_damage_3,
		"bullet_size_1": ShopStates.bullet_size_1,
		"bullet_size_2": ShopStates.bullet_size_2,
		"bullet_size_3": ShopStates.bullet_size_3,
		"double_bullet": ShopStates.double_bullet,
		"tripple_bullet": ShopStates.tripple_bullet,
		"second_bullet": ShopStates.second_bullet,
		"third_bullet": ShopStates.third_bullet,
	}
	var file = File.new()
	file.open("user://saved_data.dat", File.WRITE)
	file.store_line(to_json(save_stats))
	file.close()
	
func load_data():
	var file=File.new()
	if not file.file_exists("user://saved_data.dat"):
		print("No save to load!")
		return
		
	file.open("user://saved_data.dat", File.READ)
	var content=parse_json(file.get_line())
	for i in content.keys():
		if i == "Gold":
			Globals.gold_amount=content.get(i)
		elif i == "highest_score":
			Globals.highest_score=content.get(i)
		elif i == "health_1":
			ShopStates.health_1=content.get(i)
		elif i == "health_2":
			ShopStates.health_2=content.get(i)
		elif i == "health_3":
			ShopStates.health_3=content.get(i)
		elif i == "attack_speed_1":
			ShopStates.attack_speed_1=content.get(i)
		elif i == "attack_speed_2":
			ShopStates.attack_speed_2=content.get(i)
		elif i == "attack_speed_3":
			ShopStates.attack_speed_3=content.get(i)
		elif i == "bullet_speed_1":
			ShopStates.bullet_speed_1=content.get(i)
		elif i == "bullet_speed_2":
			ShopStates.bullet_speed_2=content.get(i)
		elif i == "bullet_speed_3":
			ShopStates.bullet_speed_3=content.get(i)
		elif i == "bullet_damage_1":
			ShopStates.bullet_damage_1=content.get(i)
		elif i == "bullet_damage_2":
			ShopStates.bullet_damage_2=content.get(i)
		elif i == "bullet_damage_3":
			ShopStates.bullet_damage_3=content.get(i)
		elif i == "bullet_size_1":
			ShopStates.bullet_size_1=content.get(i)
		elif i == "bullet_size_2":
			ShopStates.bullet_size_2=content.get(i)
		elif i == "bullet_size_3":
			ShopStates.bullet_size_3=content.get(i)
		elif i == "double_bullet":
			ShopStates.double_bullet=content.get(i)
		elif i == "tripple_bullet":
			ShopStates.tripple_bullet=content.get(i)
		elif i == "second_bullet":
			ShopStates.second_bullet=content.get(i)
		elif i == "third_bullet":
			ShopStates.third_bullet=content.get(i)
	file.close()
	return content
