class_name Inventory
extends Resource

#signal inventory_changed 

#@export var slots: Array[InventorySlot] = []
@export var max_slots: int = 30

#var item: Item = null
var quantity: int = 0

#func add_item():
	#item + 1
	#quantity + 1
	
	#if slots.is_empty():
	#slots.item = new_item
