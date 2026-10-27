extends Node2D

@onready var dialogue_text: RichTextLabel = $CanvasLayer/DialogueBox/DialogueText
@onready var next_button: Button = $CanvasLayer/DialogueBox/NextButton

# Current dialogue index and section
var current_index: int = 0
var current_section: int = 0

# Dr Brown's dialogue
var first_dialogue: Array[String] = [
"Greetings fellow traveller...",
"I see you are my new recruit, allow me to introduce myself...",
"I am Dr Brown, fellow inventor and researcher.",
"For decades I have been building multiple reactors to demonstrate the feasibility of turning plastic into fuel.",
"And I want you to collect all the waste that is orbiting earth so we can make recycled and cheaper fuel for those who are still on earth...",
"Don't worry! You'll do just fine! My colleague will help you get set up."
]

# Colleague's dialogue
var colleague_dialogue: Array[String] = [
"Hello! I'm another Scientist working alongside Dr Brown.",
"Tell me, what's your name?"
]

func _ready() -> void:
	show_dialogue(current_index)


# Display the current dialogue line
func show_dialogue(index: int) -> void:
	var active_dialogue: Array[String]
	if current_section == 0:
		active_dialogue = first_dialogue
	else:
		active_dialogue = colleague_dialogue
	
	if index >= 0 and index < active_dialogue.size():
		dialogue_text.text = active_dialogue[index]


# Called when the Next button is pressed
func _on_next_button_pressed() -> void:
	var active_dialogue: Array[String]
	if current_section == 0:
		active_dialogue = first_dialogue
	else:
		active_dialogue = colleague_dialogue
	
	current_index += 1
	if current_index < active_dialogue.size():
		show_dialogue(current_index)
	else:
		if current_section == 0:
			start_character_transition()
		else:
			print("Dialogue complete")


# Begin the fade transition between characters
func start_character_transition() -> void:
	$CanvasLayer/Fade_transition2.show()
	$CanvasLayer/Fade_transition2/Fade_timer.start()
	$CanvasLayer/Fade_transition2/AnimationPlayer2.play("Fade_in")


# Called when an animation finishes
func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fade in" and current_section == 0:
		$CanvasLayer/NPCIcon.hide()
		$CanvasLayer/ColleagueIcon.show()
	
	current_section = 1
	current_index = 0
	show_dialogue(current_index)
	$CanvasLayer/Fade_transition2/AnimationPlayer2.play("Fadou_out")
