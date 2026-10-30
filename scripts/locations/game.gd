extends Node2D
class_name Game
#This is where I will make all of the different scenes run within a loop 

@export var locations: Array[PackedScene]

var current_location: Node2D
var new_location: Node2D
var current_location_index: int = 0

func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("next_scene"):
	if current_location_index < locations.size()-1:
		load_location(current_location_index+1)
	


func _ready() -> void:
	load_location(0)

#loading the locations, removing them and then adding the next one
func load_location(index: int) -> void:
	if index < 0 or index >= locations.size():
		print("NO MORE LOCATIONS")
		return
	#if current_location:
		#remove_child(current_location)
	current_location_index = index 
	current_location = locations[index].instantiate()

	if current_location:
		remove_child(current_location)
		
	new_location = current_location
	add_child(new_location)
	
	#current_location.location_completed.connect(next_location)
	#print("THIS WORKS")
