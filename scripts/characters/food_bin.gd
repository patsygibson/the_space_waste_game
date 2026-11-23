extends Control

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if not data is Dictionary:  #If the item does not have any of the familiar names
		return false 
	var item = data.get("item")
	
	if item == null:
		return false
	return item.category == "FOOD"
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	var item = data["item"]
	var source_slot = data["source_slot"]
	
	source_slot.remove_item_component()
	print(item.item_name, " was recycled!")
