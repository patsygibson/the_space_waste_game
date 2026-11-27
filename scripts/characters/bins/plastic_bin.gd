class_name PlasticBin
extends Control

signal dropped

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Plastic bin is here!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if not data is Dictionary:
		print("Plastic Bin: Data is not a dictionary")
		return false 
		
	var item = data.get("item")
	
	if item == null:
		return false
		
	print("Plastic bin Bin: Item name: ", item.item_name)
	print("Plastic bin: Item category: ", item.category)
	
	var accepted = item.category.to_upper() == "PLASTIC"
	print("WE HAVE: ", item.category.to_upper())
	print("IS IT ACCEPTED? ", accepted)
	
	return accepted
	
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var item = data["item"]
	var source_slot = data["source_slot"]
	
	source_slot.remove_item_component()
	
	Game.save_items()
	dropped.emit()
	
	print(item.item_name, " was recycled in the plastic bin!")
