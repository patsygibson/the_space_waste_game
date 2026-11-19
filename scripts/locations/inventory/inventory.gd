class_name Inventory
extends Control
var slots: Array[InventorySlot]
@onready var panel: Panel = get_node("Panel")
@onready var info_text: Label = get_node("Panel/InfoText")
#@export var current_item: Array[ItemComponent]


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


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/locations/main.tscn")
