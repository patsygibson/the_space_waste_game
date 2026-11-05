extends Node2D

var button_type = null

#func _ready():
	#fade animation
	#$Fade_transition.show()
	#$Fade_transition/AnimationPlayer.play("Fade_out")
	
func _on_start_pressed():
	button_type = "start"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_in")
	

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/locations/options.tscn")
	

func _on_quit_pressed():
	get_tree().quit()
	


func _on_fade_timer_timeout():
	if button_type == "start" :
		get_tree().change_scene_to_file("res://scenes/locations/intro_scene.tscn")
	
	
