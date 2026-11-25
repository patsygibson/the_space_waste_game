class_name Trash extends Bigbrown
@export var score_value: int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pass

#When player enters trash, the trash disappears and increments score +1 
func _on_body_entered(body):
	if body is Player:
		body.update_score(score_value)
		print("New Score: ", body.score)
		
		print("COLLECTING ITEM: ",%ItemComponent.item.item_name)
		print("ITEM RESOURCE PATH: ",%ItemComponent.item.resource_path)
		Game.inventory.add_item(%ItemComponent.item)
		
		print("SAVING INVENTORY NOW!")
		Game.save_items() #Save item function found within Game Manager script
		die()
	
