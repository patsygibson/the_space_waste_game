class_name Inventory
extends Control
var slots: Array[InventorySlot]
@export var items : Array[Resource]
@onready var panel: Panel = get_node("Panel")
@onready var info_text: Label = get_node("Panel/InfoText")
@onready var quantity_text: Label = get_node("Panel/SlotContainer/InventorySlot/Icon/QuantityText")
@onready var icon: TextureRect = get_node("Panel/SlotContainer/InventorySlot/Icon")
var item_data: ItemData
var quantity: int = 0

func set_item(item):
	item_data = item
	if item_data == null:
		quantity = 0;
		icon.visible = false
		
	else:
		quantity = 1 
		icon.visible = true
		icon.texture = item_data.icon
		add_item_component()
		update_quantity_text()
	
	
func add_item_component():
	quantity += 1
	update_quantity_text()

func remove_item_component():
	quantity -= 1
	update_quantity_text()
	
	if quantity == 0:
		item_data = null
		#set_item()
		## remove from current items array
	
func update_quantity_text():
	if quantity <= 1:
		quantity_text.text = ""
	else:
		quantity_text.text = str(quantity)


func get_slot_to_add(item) -> InventorySlot:
	var empty_slot = null
	for slot in slots:
		if slot.item == item and slot.quantity < item.max_stack_size:
			return slot
		if slot.item == null and empty_slot == null:
			empty_slot = slot
	return empty_slot


func get_slot_to_remove (item):
	var total = 0
	for slot in slots:
		if slot.item == item:
			total += slot.quantity
	return total

func get_number_of_item(item):
	var total = 0 
	
	for slot in slots: 
		if slot.item == item:
			total += slot.quantity
	return total
