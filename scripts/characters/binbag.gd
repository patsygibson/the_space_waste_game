class_name Binbag extends Trash

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
		Game.inventory.set_item(%ItemComponent.item)
		die()
	
