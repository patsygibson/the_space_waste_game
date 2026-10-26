extends Node2D
var button_type = null

#func _ready():
	#$Fade_transition.show()
	#$Fade_transition/AnimationPlayer.play("Fade_out")

func _on_return_pressed():
	get_tree().change_scene_to_file("res://scenes/locations/main_menu.tscn")
	
	
#func _on_fade_timer_timeout():
	#if button_type == "return" :
		#get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
