class_name InventorySlot
extends Control

var item_data: ItemData
var quantity: int = 0

@onready var icon: TextureRect = $Icon
@onready var quantity_text: Label = $Icon/QuantityText

#Setting the item, its icon and quantity
func set_item(new_item: ItemData) -> void:
	item_data = new_item
	
	if item_data == null: #if no item data, quantity is zero and there's no icon
		print("no item data received")
		quantity = 0;
		icon.visible = false
		icon.texture = null
		
	else:                #else if there is item, increment its quantity and how icon visibilty
		print("item received: ", item_data.item_name)
		print("icon recevied: ", item_data.icon)
		
		quantity = 1   
		icon.visible = true
		icon.texture = item_data.icon
		
		update_quantity_text()
	
	
func add_item_component() -> void:
	quantity += 1
	update_quantity_text()

func remove_item_component():
	quantity -= 1
	update_quantity_text()
	
	if quantity <= 0:           #explain here
		set_item(null)
	else:
		update_quantity_text()
	
	#comment here
func update_quantity_text() -> void:
	if quantity <= 1:
		quantity_text.text = ""         #explain this
	else:
		quantity_text.text = str(quantity)  #explain this
		
		
#NEW FUNCTION SO WE CAN GET THE ITEMS AND DRAG THEM INTO THE BIN IN TRASH LAB
func _get_drag_data(_at_position: Vector2):
		
		if item_data == null:
			return null
		
		var data = {"item": item_data, "source_slot": self}
		
		var preview = TextureRect.new()
		preview.texture = item_data.icon
		preview.custom_minimum_size = Vector2(48, 48)
		preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		
		set_drag_preview(preview)
		return data
