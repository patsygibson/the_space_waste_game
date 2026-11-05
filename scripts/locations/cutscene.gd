extends Node2D

@onready var dialogue_text : RichTextLabel = $CanvasLayer/Panel/DialogueText
@onready var next_button : Button = $CanvasLayer/Panel/NextButton
@onready var confirm_button : Button = $CanvasLayer/Panel/ConfirmButton

var current_index: int = 0 


var engineer_dialogue: Array[String] = [
	"Greetings!", "I'm an engineer working alongside Dr Brown.", "Since you have succesfully collected enough waste, I now have enough fuel to build an extension on your spaceship!",
	"Your spaceship will now be able to... ", "Enojy and good luck out there!" ]

func _ready() -> void:
	confirm_button.hide()
	$CanvasLayer/EngineerIcon.show()
	show_dialogue()

func show_dialogue() -> void:
	if current_index >= 0 and current_index < engineer_dialogue.size():
		dialogue_text.text = engineer_dialogue[current_index]

func _on_next_button_pressed() -> void:
	current_index +=1
	
	if current_index < engineer_dialogue.size():
		show_dialogue()
	else:
		next_button.hide()
		confirm_button.show()


func _on_confirm_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/locations/main.tscn")
