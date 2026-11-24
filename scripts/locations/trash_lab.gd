extends Node2D
@onready var invt = $UILayer/Inventory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.set_inventory($UILayer/Inventory)
	Game.load_items()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Inventory"):
		invt.visible = not invt.visible

func _drop_item(_at_position: Vector2, data) -> void:
	var item = data["item"]
	var source_slot = data["source slot"]
	
	source_slot.remove_item_component() #Function from InventorySlot being called
	
	Game.save_items()  #Function from Game manager being called
	
	print(item.item_name, " was recycled!")
	
