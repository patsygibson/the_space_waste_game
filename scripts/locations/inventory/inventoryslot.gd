class_name InventorySlot
extends Node
@export var itemcomponent : ItemComponent
@export var inventory : Inventory

var quantity: int

@onready var icon: TextureRect = get_node("Icon")
@onready var quantity_text: Label = get_node("Icon/QuantityText")



func set_item(new_item: ItemComponent):
	itemcomponent = new_item
	quantity = 1
	if itemcomponent == null:
		icon.visible = false
	else:
		icon.visible = true
		icon.texture = itemcomponent.icon
		
	update_quantity_text()
	
func add_itemcomponent():
	quantity += 1
	update_quantity_text()

func remove_itemcomponent():
	quantity -= 1
	update_quantity_text()
	
	if quantity == 0:
		set_item(null)
	
func update_quantity_text():
	if quantity <= 1:
		quantity_text.text = ""
	
