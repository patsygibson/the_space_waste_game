class_name InventorySlot
extends Node
@export var item_component : ItemComponent
@export var inventory : Inventory

var quantity: int

@onready var icon: TextureRect = get_node("Icon")
@onready var quantity_text: Label = get_node("Icon/QuantityText")



func set_item(new_item: ItemComponent):
	item_component = new_item
	quantity = 1
	if item_component == null:
		icon.visible = false
	else:
		icon.visible = true
		icon.texture = item_component.icon
		
	update_quantity_text()
	
func add_item_component():
	quantity += 1
	update_quantity_text()

func remove_item_component():
	quantity -= 1
	update_quantity_text()
	
	if quantity == 0:
		set_item(null)
	
func update_quantity_text():
	if quantity <= 1:
		quantity_text.text = ""
	
