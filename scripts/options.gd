extends Node2D
var button_type = null

func _ready():
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("Fade_out")

func _on_return_pressed():
	button_type = "return"
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("Fade_out")
	$Fade_transition/AnimationPlayer.play("Fade_in")
	

func _on_fade_timer_timeout():
	if button_type == "return" :
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
