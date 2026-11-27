extends Node2D
@onready var invt = $UILayer/Inventory

@export var food_bin: FoodBin
@export var plastic_bin: PlasticBin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("TRASH LAB IS RUNNING!!!!")
	Game.set_inventory($UILayer/Inventory)
	Game.load_items()
	food_bin.dropped.connect(check_inventory_empty)
	plastic_bin.dropped.connect(check_inventory_empty)
	$UILayer/Panel/Continue.visible = false
	check_inventory_empty()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Inventory"):
		invt.visible = not invt.visible


func check_inventory_empty() -> void:  #Inventory is empty but when every slot in slots equals not to zero inventory_empty function is false
	print("Check Inventory")
	var inventory_empty = true
	for slot in Game.inventory.slots:
		if slot.item_data != null:
			inventory_empty = false
			break
	$UILayer/Panel/Continue.visible = inventory_empty #it's set to visible once the inventory has been emptied. 


func _on_continue_pressed() -> void:
	print("BUTTON PRESSED")
	get_tree().change_scene_to_file("res://scenes/locations/cutscene.tscn")
