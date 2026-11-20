extends Node2D
#This is where I will make all of the different scenes run within a loop 

var current_location: Node2D
var new_location: Node2D
var current_location_index: int = 0
var inventory: Inventory

#func _ready() -> void:
	#get_tree().change_scene_to_file("res://scenes/locations/main_menu.tscn")
	
#func _inventory_just_pressed() -> void:
	#if Input.is_action_just_pressed("Inventory"):
		#get_tree().change_scene_to_file("res://scenes/locations/inventory/inventory.tscn")

func set_inventory(inv: Inventory) -> void:
	inventory = inv
