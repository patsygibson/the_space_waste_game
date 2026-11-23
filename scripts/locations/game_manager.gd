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

#loops through all of the inventory slots
func save_items() -> void:
	if inventory == null: 
		return
	var saved_items: Array []
	
	for slot in inventory.slot:  #if a slot contains an item, save its resource path and quantity
		if slot.item_data != null: 
			saved_items.append( {"item_path": slot.item_data.resource_path, "quantity": slot.quantity})
			
	var save_file = FileAccess.open("user://inventory.data", FileAccess.WRITE)
	
	if save_file == null:
		print(" could not save inventory")
		return
	save_file.store_var(saved_items)
	save_file.close()
	print("Invenotry Saved!")
