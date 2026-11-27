class_name FoodBin
extends Control

signal dropped

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
	var item: ItemData = data["item"] #as ItemData is mentioned so we can then call fuel_amounth within this function
	var source_slot = data["source_slot"]
	
	var player = get_tree().get_first_node_in_group("Player")  #calling Player from its group 'player' I made previously
	player.add_fuel(item.fuel_amount) #getting the fuction add fuel in player script and adding the fuel amount from item data. 
	
	source_slot.remove_item_component()
	
	Game.save_items()
	
	dropped.emit()   #signal being called so it can check if inventroy is empty so it can show the continue button or not
	
	print(item.item_name, " was recycled in the food bin!")
	
