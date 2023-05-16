extends MarginContainer


func _ready():
	GameSave.load_data()
	$HBoxContainer/MarginContainer/HBoxContainer/gold_amount.text = str(Globals.gold_amount)
	$HBoxContainer/MarginContainer3/HBoxContainer/Highest_Score.text = "Highscore:" + str(Globals.highest_score)


func _on_Startbutton_pressed():
	get_tree().change_scene("res://scenes/main_scene/Main.tscn")
	

func _on_Quitbutton_pressed():
	get_tree().quit()


func _on_shopbutton_pressed():
	get_tree().change_scene("res://scenes/shop/shop.tscn")
	

func _on_Button_pressed():
	var dir = Directory.new()
	dir.remove("user://saved_data.dat")
	print("geht")
