class_name Inventory
extends Node
var slots: Array[InventorySlot]
@onready var panel: Panel = get_node("Panel")
@onready var info_text: Label = get_node("Panel/InfoText")
@export var itemcomponent: Array[ItemComponent]


func _ready() -> void:
	Input.MOUSE_MODE_VISIBLE

func get_slot_to_add(itemcomponent) -> InventorySlot:
	var empty_slot = null
	for slot in slots:
		if slot.itemcomponent == itemcomponent and slot.quantity < itemcomponent.max_stack_size:
			return slot
		if slot.itemcomponent == null and empty_slot == null:
			empty_slot = slot
	return empty_slot


func get_slot_to_remove (itemcomponent):
	var total = 0
	for slot in slots:
		if slot.itemcomponent == itemcomponent:
			total += slot.quantity
	return total

func get_number_of_item(itemcomponent):
	var total = 0 
	
	for slot in slots: 
		if slot.itemcomponent == itemcomponent:
			total += slot.quantity
	return total


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/locations/main.tscn")
