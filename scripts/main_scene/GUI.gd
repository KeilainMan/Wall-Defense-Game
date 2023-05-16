extends MarginContainer


onready var lifebar = $VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/Healthbarcontainer/Healthbar
onready var tween = $Tween
onready var animated_health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var wall_max_health = Globals.wall_max_health
	lifebar.max_value = wall_max_health


#func _process(delta):
	#var round_value = round(animated_health)
	#lifebar.value = animated_health


func _on_Mauer_health_changed():
	var wall_health = Globals.wall_health
	update_health(wall_health)
	
func update_health(new_value):
	lifebar.value = new_value
	#tween.interpolate_property(self, "animated_health", animated_health, new_value, 0.6)
	#if not tween.is_active():
		#tween.start()


func _on_Mauer_game_over():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	tween.interpolate_property(self, "modulate", start_color, end_color, 1.0)

func update_time(time):
	$VBoxContainer/HBoxContainer/Time_and_Score/Time/Score_bg/Time.text = str(time)
	
func update_score(score):
	$VBoxContainer/Score/Score_bg/Score.text = str(score)
