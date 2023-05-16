extends CanvasLayer






func _ready():
	pass # Replace with function body.

	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
	
func _on_Menuebutton_pressed():
	get_tree().change_scene("res://scenes/main_ui/Main_UI.tscn")
	
func hide_HUD():
	$Menuebutton.hide()
	$MarginContainer2/HBoxContainer/AspectRatioContainer/NinePatchRect.hide()
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/Time.hide()
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/Score.hide()
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/Plus.hide()
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/gold.hide()
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/gleich.hide()
	
func show_end_game_HUD(time, score, level_gold_gain):
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/Time.text = str(time)
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/Score.text = str(score)
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/gold.text = str(level_gold_gain)
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/Time.show()
	yield(get_tree().create_timer(0.3), "timeout")
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/Plus.show()
	yield(get_tree().create_timer(0.3), "timeout")
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/Score.show()
	yield(get_tree().create_timer(0.3), "timeout")
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/gleich.show()
	yield(get_tree().create_timer(0.3), "timeout")
	$MarginContainer2/HBoxContainer/MarginContainer/HBoxContainer/gold.show()
	yield(get_tree().create_timer(0.3), "timeout")
	$MarginContainer2/HBoxContainer/AspectRatioContainer/NinePatchRect.show()
	yield(get_tree().create_timer(0.6), "timeout")
	$Menuebutton.show()
	
