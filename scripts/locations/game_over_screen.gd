extends Control



func _on_quit_button_pressed():
	get_tree().quit()

func set_score(value):
	$Panel/Score.text = "Score: " + str(value)
	
func set_HighScore(value):
	$Panel/HighScore.text = "High Score: " + str(value)  
