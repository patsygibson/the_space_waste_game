class_name Enemyship extends Node2D
@export var speed = 1
@export var hp = 3


func die():
	queue_free()
	
func _on_body_entered(body):
	if body is Player:
		if not body.get_node("Shield").visible:
			body.die() 
			
# If the shield is not visible, then the player dies
func take_damage(amount):
	hp -= amount
	if hp <= 0:
		die()
