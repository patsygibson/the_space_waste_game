class_name Inventory
extends Control
var slots: Array[InventorySlot]
@onready var panel: Panel = get_node("Panel")
@onready var info_text: Label = get_node("Panel/InfoText")
@export var item_component: Array[ItemComponent]


func get_slot_to_add(item_component) -> InventorySlot:
	var empty_slot = null
	for slot in slots:
		if slot.item_component == item_component and slot.quantity < item_component.max_stack_size:
			return slot
		if slot.item_component == null and empty_slot == null:
			empty_slot = slot
	return empty_slot


func get_slot_to_remove (item_component):
	var total = 0
	for slot in slots:
		if slot.item_component == item_component:
			total += slot.quantity
	return total

func get_number_of_item_component(item_component):
	var total = 0 
	
	for slot in slots: 
		if slot.item_component == item_component:
			total += slot.quantity
	return total


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/locations/main.tscn")
