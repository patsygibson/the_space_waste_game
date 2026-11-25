extends Control

func _ready() -> void:
	print("FOOD BIN IS HERE!!!!")

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	print("FOOD BIN: checking dropped item")
	
	if not data is Dictionary:  #If the item does not have any of the familiar names
		print("Food bin: Data is not a dictionary")
		return false 
	
	var item = data.get("item")
	
	if item == null:
		print("Food bin:no item found")
		return false
	print("Food Bin: Item name: ", item.item_name)
	print("Food Bin: Item category: ", item.category)
	
	var accepted = item.category.to_upper() == "FOOD"
	print("WE HAVE: ", item.category.to_upper())
	print("IS IT ACCEPTED? ", accepted)
	
	return accepted
	
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var item = data["item"]
	var source_slot = data["source_slot"]
	
	source_slot.remove_item_component()
	
	Game.save_items()
	
	print(item.item_name, " was recycled in the food bin!")
	
