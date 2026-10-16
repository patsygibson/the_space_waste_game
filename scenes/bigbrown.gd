class_name Bigbrown extends Area2D

@export var speed = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += speed * delta
	
func die():
	queue_free()


func _on_body_entered(body):
	if body is Player:
		print("Shield visible: ", body.get_node("Shield").visible)
		#body.die() #the Player dies
		#die() #it dies as well
		if not body.get_node("Shield").visible:
			body.die()
			die()
# If the shield is not visible, then the player and big brown die
