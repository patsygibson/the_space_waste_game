extends Node2D
class_name Game
#This is where I will make all of the different scenes run within a loop 

var main_menu = preload("res://scenes/locations/main_menu.tscn").instantiate()

var current_location: Node2D
var new_location: Node2D
var current_location_index: int = 0

func _ready() -> void:
	get_tree().change_scene_to_file("res://scenes/locations/main_menu.tscn")
	
