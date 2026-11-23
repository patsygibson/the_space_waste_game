class_name ItemData
extends Resource

@export var item_name: String
@export var icon: CompressedTexture2D
@export var quantity: int
@export var max_stack_size: int = 10

@export_enum("FOOD", "PLASTIC") var category: String = "PLASTIC"  # = "Plastic" by default
