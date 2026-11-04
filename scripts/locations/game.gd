extends Node2D
class_name Game
#This is where I will make all of the different scenes run within a loop 

@export var locations: Array[PackedScene]

var current_location: Node2D
var new_location: Node2D
var current_location_index: int = 0

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("next_scene"):
	
	

func _ready() -> void:
	load_location()


#loading the locations, removing them and then adding the next one
func load_location() -> void:
	current_location_index += 1
	if current_location_index < 0 or current_location_index >= locations.size():
		remove_child(current_location)
		new_location = current_location
		add_child(new_location)
		current_location = locations[current_location_index].instantiate()
	
	#current_location.location_completed.connect(new_location)
	#print("THIS WORKS")
	
	#if score in main scene is += 50 
	#load to next scene after the main scene
