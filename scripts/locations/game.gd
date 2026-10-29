extends Node2D
class_name Game
#This is where I will make all of the different scenes run within a loop 

@export var locations: Array[PackedScene]

var current_location: Node2D
var new_location: Node2D
var current_location_index: int = 0

func _ready() -> void:
	load_location(0)

#loading the locations, removing them and then adding the next one
func load_location(index: int) -> void:
	if index < 0 and index >= locations.size():
		print("NO MORE LOCATIONS")
		return
	current_location_index = index 
	current_location = locations[index].instantiate()
	

	#remove_child(current_location)
	
	#add_child(new_location)
	#new_location = current_location

#or do it manually??? 
var simultaneous_scene = preload("res://scenes/locations/main_menu.tscn")

func _add_a_scene_manually():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().root.add_child(simultaneous_scene)   #extracted from godot
