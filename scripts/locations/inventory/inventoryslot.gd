class_name InventorySlot
extends Node
@export var inventory : Inventory
var item_data: ItemData
var quantity: int = 0
@export var item : Array[ItemComponent]
@onready var icon: TextureRect = get_node("Icon")
@onready var quantity_text: Label = get_node("Icon/QuantityText")



func set_item():
	
	if item_data == null:
		quantity = 0;
		icon.visible = false
		
	else:
		quantity = 1 
		icon.visible = true
		icon.texture = item_data.icon
		
	update_quantity_text()
	
func add_item_component():
	quantity += 1
	update_quantity_text()

func remove_item_component():
	quantity -= 1
	update_quantity_text()
	
	if quantity == 0:
		item_data = null
		set_item()
	
func update_quantity_text():
	if quantity <= 1:
		quantity_text.text = ""
	else:
		quantity_text.text = str(quantity)
	
