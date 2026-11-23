extends Node2D
@onready var invt = $UILayer/Inventory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.set_inventory($UILayer/Inventory)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Inventory"):
		invt.visible = not invt.visible



func _drag_item() -> void:
	pass

func _drop_item() -> void:
	pass
