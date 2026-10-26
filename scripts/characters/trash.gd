class_name trash extends Bigbrown
#@export var high_score = $GameOverScreen/HighScore
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
		print("New Score: ", body.score)
	#if score < high_score:
		#high_score = score  #if the score becomes greater than the old high score then that score becomes the new high score. 
		die()
