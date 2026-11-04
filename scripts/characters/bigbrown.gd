class_name Bigbrown extends Area2D
## This is the base Enemy Class.
## It declares movement and overlap funtionality
@export var speed = 150
@export var hp = 100
var speedMult = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.

	
func _process(delta):
	global_position.y += speed * delta * (Main.scroll_speed*(0.01))
func die():
	queue_free()


func _on_body_entered(body):
	if body is Player:
		#print("Shield visible: ", body.get_node("Shield").visible)
		#body.die() #the Player dies
		#die() #it dies as well
		if not body.get_node("Shield").visible:
			body.die() 
# If the shield is not visible, then the player dies
func take_damage(amount):
	hp -= amount
	if hp <= 0:
		die()


func _on_kill_timer_timeout() -> void:
	queue_free()
