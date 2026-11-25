extends Node2D
#This Class manages all of the functions that run outside of the classes

var current_location: Node2D
var new_location: Node2D
var current_location_index: int = 0
var inventory: Inventory

func set_inventory(inv: Inventory) -> void:
	inventory = inv
	
func change_scene(scene_path: String) -> void:
	call_deferred("_change_scene", scene_path)
	
func _change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
	
	


#loops through all of the inventory slots
func save_items() -> void:
	if inventory == null:
		print("ERROR: No inventory registered") 
		return
		
	var saved_items: Array = []
	
	for slot in inventory.slots:  #if a slot contains an item, save its resource path and quantity
		if slot.item_data != null: 
			saved_items.append( {"item_path": slot.item_data.resource_path, "quantity": slot.quantity})
			
	var save_file = FileAccess.open("user://inventory.data", FileAccess.WRITE)
	
	if save_file == null:
		print(" could not save inventory!")
		return
		
	save_file.store_var(saved_items)
	save_file.close()
	
	print("Inventory Saved Successfully!")
	print("Number of saved items:", saved_items.size())

func load_items() -> void:
	
	if inventory == null:
		return
	
	var save_file = FileAccess.open("user://inventory.data", FileAccess.READ)
	
	if save_file == null:
		print("No inventory data found")
		return
	
	var saved_items = save_file.get_var()
	save_file.close()
	
	for slot in inventory.slots:
		#print("Clearing invenotry")  #Clearing the inventory first before restoring saved items
		slot.set_item(null)
	
	#Restore saved items
	for saved_item in saved_items:
		var item = load(saved_item["item_path"]) as ItemData #What is item_path
		
		if item == null:
			print(" could not load: ", saved_item["item_path"])
			continue
		
		for i in range(saved_item["quantity"]):
			inventory.add_item(item)
		
		print("Inventory laoded")
