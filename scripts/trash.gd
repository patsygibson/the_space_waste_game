class_name trash extends Bigbrown

@export var score_value: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pass

func _on_body_entered(body):
	if body is Player:
		body.update_score(score_value)
		print("TRASH HIT PLAYER. New Score: ", body.score)
		die()
