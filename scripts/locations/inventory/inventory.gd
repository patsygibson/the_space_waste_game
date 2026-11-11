class_name Inventory
extends Node
var slots: Array[InventorySlot]
@onready var panel: Panel = get_node("Panel")
@onready var info_text: Label = get_node("Panel/InfoText")
#@export var starter_item: Array[Item]

#func _ready() -> void:
	#toggle_window(false) #setting up the visibility of window at the start
	#
	#Assigning slots for inventory items
	#for child in get_node("Panel/SlotContainer").get_children():
		#slots.append(child)
		#child.set_item(null)
		#child.inventory = self
	#
	#for item in starter_items:
		#add_item(item)
	#if Input.is_action_just_pressed("Inventory"):
		#toggle_window(!window.visible)


#func _process(delta: float) -> void:
	#pass
#
#func toggle_window(open: bool):
	#window.visible = open
	#
	#Diplaying mouse when inventory is open
	#if open:
		#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	#else:
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
#
#func on_give_player_item(item: Item, amount: int):
	#pass
#
#func add_item(item: Item):
	#var slot = get_slot_to_add(item)
	#If slot has no slot return (if inventory is full)
	#if slot == null:
		#return
	#Setting slot as that item
	#if slot.item == null:
		#slot.set_item(item)
	#Increase the quantity
	#elif slot.item == item:
		#slot.add_item()
#
#func remove_item(item: Item):
	#var slot = get_slot_to_remove(item)
	#
	#if slot == null or slot.item == item:
		#return
		#
		#slot.remove_item()
#
#
#func get_slot_to_add(item: Item) -> InventorySlot:
	#for slot in slots:
		#if slot.item == item and slot.quantity < item.max_stack_size:
			#return slot
		#return null
	#
#func get_slot_to_remove (item: Item) -> InventorySlot:
	#for slot in slots:
		#if slot.item == item:
			#return slot
		#return null
#
#func get_number_of_item(item: Item) -> int:
	#var total = 0 
	#
	#for slot in slots: 
		#if slot.item == item:
			#total += slot.quantity
	#return total
	#
