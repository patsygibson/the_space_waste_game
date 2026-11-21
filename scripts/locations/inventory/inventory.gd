class_name Inventory
extends Control
var slots: Array[InventorySlot]

@onready var panel: Panel = $Panel
@onready var info_text: Label = $Panel/InfoText
@onready var slot_container: GridContainer = $Panel/SlotContainer

func _ready() -> void:
	for child in slot_container.get_children():
		if child is InventorySlot:
			slots.append(child)
			child.set_item(null)

#comment here
func get_slot_to_add(item: ItemData) -> InventorySlot:
	var empty_slot: InventorySlot = null
	
	for slot in slots:
		if slot.item_data == item and slot.quantity < item.max_stack_size: #explain this in detail
			return slot
			
		if slot.item_data == null and empty_slot == null: #explain this in detail
			empty_slot = slot
			
	return empty_slot
	
#comment here
func add_item(item: ItemData) -> void:
	if item == null:
		print("No Item Data supplied...")
		return
		
	var slot = get_slot_to_add(item)
	
	if slot == null:
		print("Inventory full!")   #expalin this 
		return
	
	if slot.item_data == null:     #explain this 
		slot.set_item(item)
	else:
		slot.add_item_component()   #explain this 

#comment here
func get_number_of_item(item):
	var total = 0 
	
	for slot in slots: 
		if slot.item_data == item:     #explain this 
			total += slot.quantity
	return total
